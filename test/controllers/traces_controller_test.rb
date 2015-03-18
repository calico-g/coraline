require 'test_helper'

class TracesControllerTest < ActionController::TestCase
  setup do
    @trace = traces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trace" do
    assert_difference('Trace.count') do
      post :create, trace: { input: @trace.input, item_id: @trace.item_id, notes: @trace.notes }
    end

    assert_redirected_to trace_path(assigns(:trace))
  end

  test "should show trace" do
    get :show, id: @trace
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trace
    assert_response :success
  end

  test "should update trace" do
    patch :update, id: @trace, trace: { input: @trace.input, item_id: @trace.item_id, notes: @trace.notes }
    assert_redirected_to trace_path(assigns(:trace))
  end

  test "should destroy trace" do
    assert_difference('Trace.count', -1) do
      delete :destroy, id: @trace
    end

    assert_redirected_to traces_path
  end
end
