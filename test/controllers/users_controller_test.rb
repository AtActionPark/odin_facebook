require 'test_helper'

class UsersControllerTest < ActionController::TestCase



  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to user_session_path
  end

end