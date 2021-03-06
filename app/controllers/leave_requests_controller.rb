class LeaveRequestsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  # GET /leave_requests
  # GET /leave_requests.json
  def index
    @leave_requests = LeaveRequest.approved_leave.reorder("end_date DESC").page(params[:page]).per_page(8)
  end

  def approvals
    @leave_requests = LeaveRequest.not_approved.reorder("end_date DESC").page(params[:page]).per_page(8)
  end

  # GET /leave_requests/1
  # GET /leave_requests/1.json
  def show
    @leave_request = LeaveRequest.find(params[:id])
    @user = User.find(@leave_request.user)
  end

  # GET /leave_requests/new
  def new
    @leave_request = LeaveRequest.new
  end

  # GET /leave_requests/1/edit
  def edit
    @leave_request = LeaveRequest.find(params[:id])
  end

  # POST /leave_requests
  # POST /leave_requests.json
  def create
    @leave_request = LeaveRequest.new(leave_request_params)
    @leave_request.user = current_user
    @leave_request.approved = 'false'
    respond_to do |format|
      if @leave_request.save
        UserMailer.leave_request(current_user).deliver
        format.html { redirect_to leave_requests_path, notice: 'Leave request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @leave_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_requests/1
  # PATCH/PUT /leave_requests/1.json
  def update
    @leave_request = LeaveRequest.find(params[:id])
    respond_to do |format|
      if @leave_request.update(leave_request_params)
        format.html { redirect_to @leave_request, notice: 'Leave request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_requests/1
  # DELETE /leave_requests/1.json
  def destroy
    @leave_request.destroy
    respond_to do |format|
      format.html { redirect_to leave_requests_url }
      format.json { head :no_content }
    end
  end

  def export
    @leave = LeaveRequest.all

    respond_to do |format|
      format.html
      format.csv { send_data @leave.as_csv }
    end
  end

  def import
    LeaveRequest.import(params[:file])
    redirect_to root_url, notice: "Leave Requests imported."
  end

  def import_data

  end

  def approve_leave
    @to_approve = LeaveRequest.find(params[:id])
    @to_approve.approved = 'true'
    if @to_approve.save
      redirect_to leave_requests_path, notice: 'Toil Request Approved'
    else
      redirect_to leave_requests_path, alert: 'Something Went Wrong'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_request
      @leave_request = LeaveRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_request_params
      params.require(:leave_request).permit(:start_date, :end_date, :leave_type, :comment)
    end
end
