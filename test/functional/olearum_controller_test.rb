require 'test_helper'

class OlearumControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
