class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:show, :edit, :update, :destroy]

  # GET /time_sheets
  # GET /time_sheets.json
  def index
    @time_sheets = current_user.time_sheet
  end

  # GET /time_sheets/1
  # GET /time_sheets/1.json
  def show

  end

  # GET /time_sheets/new
  def new
    @time_sheet = TimeSheet.new
    @user = User.find(params[:user_id])
  end

  # GET /time_sheets/1/edit
  def edit

  end

  # POST /time_sheets
  # POST /time_sheets.json
  def create
    @time_sheet = TimeSheet.new(time_sheet_params)
    @time_sheet.user = User.find(params[:user_id])
    @time_sheet.end_date = @time_sheet.start_date + 6.days

    respond_to do |format|
      if @time_sheet.save
        if @time_sheet.populate_week
          format.html { redirect_to @time_sheet, notice: 'Time sheet was successfully created.' }
          format.json { render action: 'show', status: :created, location: @time_sheet }
        else
          format.html { render action: 'new', alert: 'failed to auto-populate timesheet days' }
          format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'new', :user_id => params[:user_id]  }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_sheets/1
  # PATCH/PUT /time_sheets/1.json
  def update
    respond_to do |format|
      if @time_sheet.update(time_sheet_params)
        format.html { redirect_to @time_sheet, notice: 'Time sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_sheets/1
  # DELETE /time_sheets/1.json
  def destroy
    @time_sheet.destroy
    respond_to do |format|
      format.html { redirect_to time_sheets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_sheet
      @time_sheet = TimeSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_sheet_params
      params.require(:time_sheet).permit(:start_date)
    end
end
