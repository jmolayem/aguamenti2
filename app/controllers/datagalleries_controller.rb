class DatagalleriesController < ApplicationController
  before_action :set_datagallery, only: [:show, :edit, :update, :destroy]

  # GET /datagalleries
  # GET /datagalleries.json
  def index
    @datagalleries = Datagallery.all
  end

  # GET /datagalleries/1
  # GET /datagalleries/1.json
  def show
  end

  # GET /datagalleries/new
  def new
    @datagallery = Datagallery.new
  end

  # GET /datagalleries/1/edit
  def edit
  end

  # POST /datagalleries
  # POST /datagalleries.json
  def create
    @datagallery = Datagallery.new(datagallery_params)

    respond_to do |format|
      if @datagallery.save
        @datagallery.create_activity :create, owner: current_user
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
    respond_to do |format|
      if @datagallery.update(datagallery_params)
        @datagallery.update_activity :create, owner: current_user
        format.html { redirect_to @datagallery, notice: 'Datagallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @datagallery }
      else
        format.html { render :edit }
        format.json { render json: @datagallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datagalleries/1
  # DELETE /datagalleries/1.json
  def destroy
    @datagallery.destroy
    @datagallery.create_activity :destroy, owner: current_user
    respond_to do |format|
      format.html { redirect_to datagalleries_url, notice: 'Datagallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datagallery
      @datagallery = Datagallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datagallery_params
      params.require(:datagallery).permit(:name, :dataset, :snippet, :organization, :size)
    end
end
