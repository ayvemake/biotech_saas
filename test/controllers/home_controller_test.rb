require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get stock_management" do
    get home_stock_management_url
    assert_response :success
  end

  test "should get automation" do
    get home_automation_url
    assert_response :success
  end
end
