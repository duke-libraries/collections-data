require 'test_helper'

class OverlapGroupsControllerTest < ActionController::TestCase
  setup do
    @overlap_group = overlap_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overlap_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overlap_group" do
    assert_difference('OverlapGroup.count') do
      post :create, overlap_group: { name: @overlap_group.name }
    end

    assert_redirected_to overlap_group_path(assigns(:overlap_group))
  end

  test "should show overlap_group" do
    get :show, id: @overlap_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overlap_group
    assert_response :success
  end

  test "should update overlap_group" do
    patch :update, id: @overlap_group, overlap_group: { name: @overlap_group.name }
    assert_redirected_to overlap_group_path(assigns(:overlap_group))
  end

  test "should destroy overlap_group" do
    assert_difference('OverlapGroup.count', -1) do
      delete :destroy, id: @overlap_group
    end

    assert_redirected_to overlap_groups_path
  end
end
