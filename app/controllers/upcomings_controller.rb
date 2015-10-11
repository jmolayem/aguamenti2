class UpcomingsController < ApplicationController
  before_action :set_upcoming, only: [:show, :edit, :update, :destroy]

  # GET /upcomings
  # GET /upcomings.json
  def index
    @upcomings = Upcoming.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /upcomings/1
  # GET /upcomings/1.json
  def show
  end

  # GET /upcomings/new
  def new
    @upcoming = Upcoming.new
  end

  # GET /upcomings/1/edit
  def edit
  end

  # POST /upcomings
  # POST /upcomings.json
  def create
    @upcoming = Upcoming.new(upcoming_params)

    respond_to do |format|
      if @upcoming.save
        format.html { redirect_to @upcoming, notice: 'Upcoming was successfully created.' }
        format.json { render :show, status: :created, location: @upcoming }
      else
        format.html { render :new }
        format.json { render json: @upcoming.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upcomings/1
  # PATCH/PUT /upcomings/1.json
  def update
    respond_to do |format|
      if @upcoming.update(upcoming_params)
        format.html { redirect_to @upcoming, notice: 'Upcoming was successfully updated.' }
        format.json { render :show, status: :ok, location: @upcoming }
      else
        format.html { render :edit }
        format.json { render json: @upcoming.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upcomings/1
  # DELETE /upcomings/1.json
  def destroy
    @upcoming.destroy
    respond_to do |format|
      format.html { redirect_to upcomings_url, notice: 'Upcoming was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upcoming
      @upcoming = Upcoming.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upcoming_params
      params.require(:upcoming).permit(:name, :newdate, :state, :city, :modeltyp, :organization, :sauce)
    end
end
