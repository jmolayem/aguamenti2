class DatagalleriesController < ApplicationController
  before_action :set_datagallery, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  # GET /datagalleries
  # GET /datagalleries.json
  def index
    #if params[:category].blank?
    @datagalleries = Datagallery.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
    #else
    #@category_id = Category.find_by(name: params[:category]).id
    #@listings = Listing.where(category_id: @category_id).order("created_at DESC")
    #end
  end

def search
  if params[:search].present?
    @datagalleries = Datagallery.search(params[:search])
  else
    @datagalleries = Datagallery.all
  end
end

  # GET /datagalleries/1
  # GET /datagalleries/1.json
  def show
  end

  # GET /datagalleries/new
  def new
    if current_user.admin
      @datagallery = Datagallery.new
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
    #authorize @datagallery
    @datagallery = Datagallery.new
  end

  # GET /datagalleries/1/edit
  def edit
    if current_user.admin
      @datagallery = Datagallery.edit
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  end

  # POST /datagalleries
  # POST /datagalleries.json
  def create
    @datagallery = Datagallery.new(datagallery_params)

    respond_to do |format|
      if @datagallery.save
        format.html { redirect_to @datagallery, notice: 'Datagallery was successfully created.' }
        format.json { render :show, status: :created, location: @datagallery }
      else
        format.html { render :new }
        format.json { render json: @datagallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datagalleries/1
  # PATCH/PUT /datagalleries/1.json
  def update
    if current_user.admin
      respond_to do |format|
      if @datagallery.update(datagallery_params)
        format.html { redirect_to @datagallery, notice: 'Datagallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @datagallery }
      else
        format.html { render :edit }
        format.json { render json: @datagallery.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  end

  # DELETE /datagalleries/1
  # DELETE /datagalleries/1.json
  def destroy
    if current_user.admin
      @datagallery.destroy
      respond_to do |format|
      format.html { redirect_to datagalleries_url, notice: 'Datagallery was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datagallery
      @datagallery = Datagallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datagallery_params
      params.require(:datagallery).permit(:name, :category_id, :dataset, :snippet, :organization, :size)
    end
end
