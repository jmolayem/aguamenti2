class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  def home
  end

  # GET /models
  def index
    @models = Model.all
  end

  # GET /models/1
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  def create
    MachineLearningWorker.perform_async(model_params, current_user.id)
    respond_to do |format|
      format.html { redirect_to results_index_path, notice: 'Wait while the result is being processed...' }
    end
  end

  # PATCH/PUT /models/1
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /models/1
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.permit(:Empl, :Project)
    end
end
