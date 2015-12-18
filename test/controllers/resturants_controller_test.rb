require 'test_helper'

class ResturantsControllerTest < ActionController::TestCase
  setup do
    @resturant = resturants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resturants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resturant" do
    assert_difference('Resturant.count') do
      post :create, resturant: { address: @resturant.address, name: @resturant.name, phone: @resturant.phone, website: @resturant.website }
    end

    assert_redirected_to resturant_path(assigns(:resturant))
  end

  test "should show resturant" do
    get :show, id: @resturant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resturant
    assert_response :success
  end

  test "should update resturant" do
    patch :update, id: @resturant, resturant: { address: @resturant.address, name: @resturant.name, phone: @resturant.phone, website: @resturant.website }
    assert_redirected_to resturant_path(assigns(:resturant))
  end

  test "should destroy resturant" do
    assert_difference('Resturant.count', -1) do
      delete :destroy, id: @resturant
    end

    assert_redirected_to resturants_path
  end
end
