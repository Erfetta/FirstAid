require "test_helper"

class Operator::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operator_home_index_url
    assert_response :success
  end
end
