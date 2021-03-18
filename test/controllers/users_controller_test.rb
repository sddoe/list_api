require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { birth_date: @user.birth_date, created_at: @user.created_at, gender: @user.gender, image_url: @user.image_url, name: @user.name, updated_at: @user.updated_at } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { birth_date: @user.birth_date, created_at: @user.created_at, gender: @user.gender, image_url: @user.image_url, name: @user.name, updated_at: @user.updated_at } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
