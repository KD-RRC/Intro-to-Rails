require "test_helper"

class BeersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beers_index_url
    assert_response :success
  end

  test "should get show" do
    get beers_show_url
    assert_response :success
  end

  test "should get search" do
    get beers_search_url
    assert_response :success
  end
end
