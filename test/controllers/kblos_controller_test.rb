require 'test_helper'

class KblosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kblos_index_url
    assert_response :success
  end

end
