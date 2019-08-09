require "test_helper"

class CategoriesControllerTest <ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name:"fiction")
    @user = User.create(username: "yahikoo", email: "yahikoo@example.com", password: "password", admin: true)
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end
end