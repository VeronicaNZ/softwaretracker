require "test_helper"

class ToolCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tool_categories_new_url
    assert_response :success
  end

  test "should get index" do
    get tool_categories_index_url
    assert_response :success
  end
end
