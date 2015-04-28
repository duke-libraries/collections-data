require 'test_helper'

class AnalysisGroupsControllerTest < ActionController::TestCase
  setup do
    @analysis_group = analysis_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analysis_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analysis_group" do
    assert_difference('AnalysisGroup.count') do
      post :create, analysis_group: { name: @analysis_group.name }
    end

    assert_redirected_to analysis_group_path(assigns(:analysis_group))
  end

  test "should show analysis_group" do
    get :show, id: @analysis_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @analysis_group
    assert_response :success
  end

  test "should update analysis_group" do
    patch :update, id: @analysis_group, analysis_group: { name: @analysis_group.name }
    assert_redirected_to analysis_group_path(assigns(:analysis_group))
  end

  test "should destroy analysis_group" do
    assert_difference('AnalysisGroup.count', -1) do
      delete :destroy, id: @analysis_group
    end

    assert_redirected_to analysis_groups_path
  end
end
