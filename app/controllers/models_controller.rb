class ModelsController < ApplicationController
  def home
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
    @models = Model.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /models/1
  def show
    @results = current_user.results.where(model: model)
  end

  # GET /models/new
  def new
    @model = Model.new
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
    respond_to do |format|
      if @model.save
        format.html { redirect_to models_path }
      else
        flash[:errors] = @model.errors
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /models/1
  def update
    respond_to do |format|
      if model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /models/1
  def destroy
    model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
    end
  end

  def generate_result
    MachineLearningWorker.perform_async(result_params, model.id, current_user.id)
    respond_to do |format|
      format.html { redirect_to model_path(model), notice: 'Wait while the result is being processed...' }
    end
  end

  private
    def model
      @model ||= Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:image,:id, :name, :description, :api_key, :endpoint,
                                    inputs_attributes: [:id, :name, :kind, :order, :_destroy],
                                    outputs_attributes: [:id, :name, :kind, :order, :default_value, :_destroy])
    end

    def result_params
      inputs = params.require(:model).permit(model.inputs.map(&:name))
      model.outputs.reduce(inputs) do |hash, output|
        hash.merge(output.name => output.default_value)
      end
    end
end
