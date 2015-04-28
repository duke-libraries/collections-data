require 'test_helper'

class OverlapHoldingsControllerTest < ActionController::TestCase
  setup do
    @overlap_holding = overlap_holdings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overlap_holdings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overlap_holding" do
    assert_difference('OverlapHolding.count') do
      post :create, overlap_holding: { oclc_number: @overlap_holding.oclc_number, shared_by: @overlap_holding.shared_by }
    end

    assert_redirected_to overlap_holding_path(assigns(:overlap_holding))
  end

  test "should show overlap_holding" do
    get :show, id: @overlap_holding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overlap_holding
    assert_response :success
  end

  test "should update overlap_holding" do
    patch :update, id: @overlap_holding, overlap_holding: { oclc_number: @overlap_holding.oclc_number, shared_by: @overlap_holding.shared_by }
    assert_redirected_to overlap_holding_path(assigns(:overlap_holding))
  end

  test "should destroy overlap_holding" do
    assert_difference('OverlapHolding.count', -1) do
      delete :destroy, id: @overlap_holding
    end

    assert_redirected_to overlap_holdings_path
  end
end
