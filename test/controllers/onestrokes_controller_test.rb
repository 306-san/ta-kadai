require 'test_helper'

class OnestrokesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get onestrokes_index_url
    assert_response :success
  end

  test "should get show" do
    get onestrokes_show_url
    assert_response :success
  end

end
