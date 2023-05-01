require "test_helper"

class UserToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_tools_new_url
    assert_response :success
  end

  test "should get Index" do
    get user_tools_Index_url
    assert_response :success
  end
end
