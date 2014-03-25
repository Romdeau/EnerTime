class TimeItemsController < ApplicationController
  before_action :set_time_item, only: [:show, :edit, :update, :destroy]

  # GET /time_items
  # GET /time_items.json
  def index
    @time_items = TimeItem.all
  end

  # GET /time_items/1
  # GET /time_items/1.json
  def show
  end

  # GET /time_items/new
  def new
    @time_item = TimeItem.new
  end

  # GET /time_items/1/edit
  def edit
  end

  # POST /time_items
  # POST /time_items.json
  def create
    @time_item = TimeItem.new(time_item_params)

    respond_to do |format|
      if @time_item.save
        format.html { redirect_to @time_item, notice: 'Time item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @time_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @time_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_items/1
  # PATCH/PUT /time_items/1.json
  def update
    respond_to do |format|
      if @time_item.update(time_item_params)
        format.html { redirect_to @time_item, notice: 'Time item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @time_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_items/1
  # DELETE /time_items/1.json
  def destroy
    @time_item.destroy
    respond_to do |format|
      format.html { redirect_to time_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_item
      @time_item = TimeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_item_params
      params.require(:time_item).permit(:timeday_id, :user_id, :time, :description, :category, :cost_centre)
    end
end
