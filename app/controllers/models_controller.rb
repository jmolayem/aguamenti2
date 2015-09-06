class ModelsController < ApplicationController
before_filter :authenticate_user!, only: [:maker, :new, :create, :edit, :update, :destroy]
  def home
  end

def maker
  @models = Model.where(user:current_user).order("created_at DESC")
end

def search
  if params[:search].present?
    @models = Model.search(params[:search])
  else
    @models = Model.all
  end
end

  # GET /models
  def index
    @models = Model.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /models/1
  def show
    @results = current_user.results.where(model: model)
    @usages_left = ManaPotion::CheckUsage.new(Result.new, current_user, Result::LIMIT, Result::PERIOD).remaining 
  end

  def ask
    model
  end

  # GET /models/new
  def new
    @model = Model.new
    authorize @model
    @model.inputs.build
    @model.outputs.build
  end

  # GET /models/1/edit
  def edit
    model
  end

  # POST /models
  def create
    @model = Model.new(model_params)
    @model.user_id = current_user.id
    respond_to do |format|
      if @model.save
        @model.create_activity :create, owner: current_user
        format.html { redirect_to models_path }
      else
        flash[:errors] = @model.errors
        format.html { render :new }
      end
    end
  end

  def upload
  uploaded_io = params[:model][:image]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
    end
  end

  # PATCH/PUT /models/1
  def update
    respond_to do |format|
      if model.update(model_params)
        @model.update_activity :create, owner: current_user
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /models/1
  def destroy
    model.destroy
    @model.create_activity :destroy, owner: current_user
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
    end
  end

  def generate_result
    @result = Result.new(user: current_user, model: model)
    if @result.save
      MachineLearningWorker.perform_async(@result.id, request)
      flash[:notice] = 'Wait while the result is being processed...' 
    else
      flash[:errors] = @result.errors
    end
    redirect_to model_path(model)
  end

  private
    def model
      @model ||= Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:id, :name, :description, :accuracy, :algorithm, :organization, :size, :api_key, :endpoint,
                                    inputs_attributes: [:id, :name, :kind, :order, :_destroy],
                                    outputs_attributes: [:id, :name, :kind, :order, :default_value, :_destroy])
    end

    def request_params
      inputs = params.require(:model).permit(model.inputs.map(&:name))
      model.outputs.reduce(inputs) do |hash, output|
        hash.merge(output.name => output.default_value)
      end
    end
end
