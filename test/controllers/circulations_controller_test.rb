require 'test_helper'

class CirculationsControllerTest < ActionController::TestCase
  setup do
    @circulation = circulations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:circulations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create circulation" do
    assert_difference('Circulation.count') do
      post :create, circulation: { loan_date: @circulation.loan_date, oclc_number: @circulation.oclc_number }
    end

    assert_redirected_to circulation_path(assigns(:circulation))
  end

  test "should show circulation" do
    get :show, id: @circulation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @circulation
    assert_response :success
  end

  test "should update circulation" do
    patch :update, id: @circulation, circulation: { loan_date: @circulation.loan_date, oclc_number: @circulation.oclc_number }
    assert_redirected_to circulation_path(assigns(:circulation))
  end

  test "should destroy circulation" do
    assert_difference('Circulation.count', -1) do
      delete :destroy, id: @circulation
    end

    assert_redirected_to circulations_path
  end
end
