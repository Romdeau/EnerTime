require 'test_helper'

class TimeDaysControllerTest < ActionController::TestCase
  setup do
    @time_day = time_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_day" do
    assert_difference('TimeDay.count') do
      post :create, time_day: { time_day: @time_day.time_day, time_sheet_id: @time_day.time_sheet_id, user_id: @time_day.user_id }
    end

    assert_redirected_to time_day_path(assigns(:time_day))
  end

  test "should show time_day" do
    get :show, id: @time_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_day
    assert_response :success
  end

  test "should update time_day" do
    patch :update, id: @time_day, time_day: { time_day: @time_day.time_day, time_sheet_id: @time_day.time_sheet_id, user_id: @time_day.user_id }
    assert_redirected_to time_day_path(assigns(:time_day))
  end

  test "should destroy time_day" do
    assert_difference('TimeDay.count', -1) do
      delete :destroy, id: @time_day
    end

    assert_redirected_to time_days_path
  end
end
