require 'test_helper'

class MonographHoldingsControllerTest < ActionController::TestCase
  setup do
    @monograph_holding = monograph_holdings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monograph_holdings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monograph_holding" do
    assert_difference('MonographHolding.count') do
      post :create, monograph_holding: { acquisition_modality: @monograph_holding.acquisition_modality, author: @monograph_holding.author, lc_number: @monograph_holding.lc_number, oclc_number: @monograph_holding.oclc_number, price: @monograph_holding.price, publisher: @monograph_holding.publisher, title: @monograph_holding.title }
    end

    assert_redirected_to monograph_holding_path(assigns(:monograph_holding))
  end

  test "should show monograph_holding" do
    get :show, id: @monograph_holding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monograph_holding
    assert_response :success
  end

  test "should update monograph_holding" do
    patch :update, id: @monograph_holding, monograph_holding: { acquisition_modality: @monograph_holding.acquisition_modality, author: @monograph_holding.author, lc_number: @monograph_holding.lc_number, oclc_number: @monograph_holding.oclc_number, price: @monograph_holding.price, publisher: @monograph_holding.publisher, title: @monograph_holding.title }
    assert_redirected_to monograph_holding_path(assigns(:monograph_holding))
  end

  test "should destroy monograph_holding" do
    assert_difference('MonographHolding.count', -1) do
      delete :destroy, id: @monograph_holding
    end

    assert_redirected_to monograph_holdings_path
  end
end
