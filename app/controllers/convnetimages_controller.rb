class ConvnetimagesController < ApplicationController
  before_action :set_convnetimage, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

#incorporated search to our scaffold
  def search
    if params[:search].present?
      @convnets = Convnetimage.search(params[:search])
    else
      @convnets = Convnetimage.all
    end
  end

  # GET /convnetimages
   def index
    #authorize @convnetimage
    @convnetimages = Convnetimage.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /convnetimages/1
  # GET /convnetimages/1.json
  def show
    @convnetimage_results = @convnetimage.convnetimage_results.where(user: current_user)
    @congnetimage_trend = @convnetimage.punch(request)
    @new_convnetimage_result = ConvnetimageResult.new
    @convnet_usages_left = ManaPotion::CheckUsage.new(ConvnetimageResult.new, current_user, Result::LIMIT, Result::PERIOD).remaining
  end

  # GET /convnetimages/new
  def new
    @convnetimage = Convnetimage.new
    #authorize @convnetimage
  end

  # GET /convnetimages/1/edit
  def edit
    if current_user.admin
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  end

  # POST /convnetimages
  # POST /convnetimages.json
  def create
    #authorize @convnetimage
    @convnetimage = Convnetimage.new(convnetimage_params)
    @convnetimage.user = current_user
    respond_to do |format|
      if @convnetimage.save
        format.html { redirect_to @convnetimage, notice: 'Convnetimage was successfully created.' }
      else
        flash[:errors] = @convnetimage
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /convnetimages/1
  # PATCH/PUT /convnetimages/1.json
  def update
    if current_user.admin
      respond_to do |format|
      if @convnetimage.update(convnetimage_params)
        format.html { redirect_to @convnetimage, notice: 'Convnetimage was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
    #authorize @convnetimage
  end

  # DELETE /convnetimages/1
  # DELETE /convnetimages/1.json
  def destroy
    if current_user.admin
    #authorize @convnetimage
    @convnetimage.destroy
    respond_to do |format|
      format.html { redirect_to convnetimages_url, notice: 'Convnetimage was successfully destroyed.' }
    end
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  else

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convnetimage
      @convnetimage = Convnetimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convnetimage_params
      params.require(:convnetimage).permit(
        :cover,
        :dataset,
        :name,
        :size,
        :accuracy,
        :classifier_id,
        :api,
        :description,
        :zip_image,
        :iterations
      )
    end
    #Below function may not be necessary. this function below simply mashed our inputs and outputs together for acceptable format with Azure.
    def result_params
      inputs = params.require(:model).permit(model.inputs.map(&:name))
      model.outputs.reduce(inputs) do |hash, output|
        hash.merge(output.name => output.default_value)
      end
    end
end
