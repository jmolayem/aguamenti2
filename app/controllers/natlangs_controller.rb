class NatlangsController < ApplicationController
  before_action :set_natlang, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /natlangs
  # GET /natlangs.json
  def index
    @natlangs = Natlang.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /natlangs/1
  # GET /natlangs/1.json
  def show
    @natlang_results = @natlang.natlang_results.where(user: current_user)
    @new_natlang_result = NatlangResult.new
    @natlang_usages_left = ManaPotion::CheckUsage.new(Result.new, current_user, Result::LIMIT, Result::PERIOD).remaining 
  end

  # GET /natlangs/new
  def new
    #authorize @natlang
    @natlang = Natlang.new
  end

  # GET /natlangs/1/edit
  def edit
    if current_user.admin
    else
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
    #authorize @natlang
  end

  # POST /natlangs
  # POST /natlangs.json
  def create
    @natlang = Natlang.new(natlang_params)
    #authorize @natlang
    respond_to do |format|
      if @natlang.save
        format.html { redirect_to @natlang, notice: 'Natlang was successfully created.' }
        format.json { render :show, status: :created, location: @natlang }
      else
        format.html { render :new }
        format.json { render json: @natlang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /natlangs/1
  # PATCH/PUT /natlangs/1.json
  def update
    if current_user.admin
    #authorize @natlang
    respond_to do |format|
      if @natlang.update(natlang_params)
        format.html { redirect_to @natlang, notice: 'Natlang was successfully updated.' }
        format.json { render :show, status: :ok, location: @natlang }
      else
        format.html { render :edit }
        format.json { render json: @natlang.errors, status: :unprocessable_entity }
      end
    end
    else 
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  end

  # DELETE /natlangs/1
  # DELETE /natlangs/1.json
  def destroy
    if current_user.admin
    #authorize @natlang
    @natlang.destroy
    respond_to do |format|
      format.html { redirect_to natlangs_url, notice: 'Natlang was successfully destroyed.' }
      format.json { head :no_content }
    end
    else 
      redirect_to root_url, alert: "Sorry, only the admin can do this function"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_natlang
      @natlang = Natlang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def natlang_params
      params.require(:natlang).permit(:image, :dataset, :api_key, :accuracy, :size, :organization, :classifier_id, :name, :description)
    end
end
