class TimeDaysController < ApplicationController
  before_action :set_time_day, only: [:show, :edit, :update, :destroy]

  # GET /time_days
  # GET /time_days.json
  def index
    @time_days = TimeDay.all
  end

  # GET /time_days/1
  # GET /time_days/1.json
  def show
  end

  # GET /time_days/new
  def new
    @time_day = TimeDay.new
  end

  # GET /time_days/1/edit
  def edit
  end

  # POST /time_days
  # POST /time_days.json
  def create
    @time_day = TimeDay.new(time_day_params)

    respond_to do |format|
      if @time_day.save
        format.html { redirect_to @time_day, notice: 'Time day was successfully created.' }
        format.json { render action: 'show', status: :created, location: @time_day }
      else
        format.html { render action: 'new' }
        format.json { render json: @time_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_days/1
  # PATCH/PUT /time_days/1.json
  def update
    respond_to do |format|
      if @time_day.update(time_day_params)
        format.html { redirect_to @time_day, notice: 'Time day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @time_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_days/1
  # DELETE /time_days/1.json
  def destroy
    @time_day.destroy
    respond_to do |format|
      format.html { redirect_to time_days_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_day
      @time_day = TimeDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_day_params
      params.require(:time_day).permit(:time_day, :time_sheet_id, :user_id)
    end
end
