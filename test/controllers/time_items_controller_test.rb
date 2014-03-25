require 'test_helper'

class TimeItemsControllerTest < ActionController::TestCase
  setup do
    @time_item = time_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_item" do
    assert_difference('TimeItem.count') do
      post :create, time_item: { category: @time_item.category, cost_centre: @time_item.cost_centre, description: @time_item.description, time: @time_item.time, timeday_id: @time_item.timeday_id, user_id: @time_item.user_id }
    end

    assert_redirected_to time_item_path(assigns(:time_item))
  end

  test "should show time_item" do
    get :show, id: @time_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_item
    assert_response :success
  end

  test "should update time_item" do
    patch :update, id: @time_item, time_item: { category: @time_item.category, cost_centre: @time_item.cost_centre, description: @time_item.description, time: @time_item.time, timeday_id: @time_item.timeday_id, user_id: @time_item.user_id }
    assert_redirected_to time_item_path(assigns(:time_item))
  end

  test "should destroy time_item" do
    assert_difference('TimeItem.count', -1) do
      delete :destroy, id: @time_item
    end

    assert_redirected_to time_items_path
  end
end
