class NatlangsController < ApplicationController
  before_action :set_natlang, only: [:show, :edit, :update, :destroy]

  # GET /natlangs
  # GET /natlangs.json
  def index
    @natlangs = Natlang.all
  end

  # GET /natlangs/1
  # GET /natlangs/1.json
  def show
    @natlang_results = @natlang.natlang_results.where(user: current_user)
    @natlang_result = NatlangResult.new
  end

  # GET /natlangs/new
  def new
    @natlang = Natlang.new
  end

  # GET /natlangs/1/edit
  def edit
  end

  # POST /natlangs
  # POST /natlangs.json
  def create
    @natlang = Natlang.new(natlang_params)

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
    respond_to do |format|
      if @natlang.update(natlang_params)
        format.html { redirect_to @natlang, notice: 'Natlang was successfully updated.' }
        format.json { render :show, status: :ok, location: @natlang }
      else
        format.html { render :edit }
        format.json { render json: @natlang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /natlangs/1
  # DELETE /natlangs/1.json
  def destroy
    @natlang.destroy
    respond_to do |format|
      format.html { redirect_to natlangs_url, notice: 'Natlang was successfully destroyed.' }
      format.json { head :no_content }
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
