require 'test_helper'

class InterlibraryLoansControllerTest < ActionController::TestCase
  setup do
    @interlibrary_loan = interlibrary_loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interlibrary_loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interlibrary_loan" do
    assert_difference('InterlibraryLoan.count') do
      post :create, interlibrary_loan: { oclc_number: @interlibrary_loan.oclc_number, request_type: @interlibrary_loan.request_type, transaction_date: @interlibrary_loan.transaction_date }
    end

    assert_redirected_to interlibrary_loan_path(assigns(:interlibrary_loan))
  end

  test "should show interlibrary_loan" do
    get :show, id: @interlibrary_loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interlibrary_loan
    assert_response :success
  end

  test "should update interlibrary_loan" do
    patch :update, id: @interlibrary_loan, interlibrary_loan: { oclc_number: @interlibrary_loan.oclc_number, request_type: @interlibrary_loan.request_type, transaction_date: @interlibrary_loan.transaction_date }
    assert_redirected_to interlibrary_loan_path(assigns(:interlibrary_loan))
  end

  test "should destroy interlibrary_loan" do
    assert_difference('InterlibraryLoan.count', -1) do
      delete :destroy, id: @interlibrary_loan
    end

    assert_redirected_to interlibrary_loans_path
  end
end
