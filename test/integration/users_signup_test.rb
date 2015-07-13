require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, user: { email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, user: { email: "user@valid.com",
                               password:              "foobar",
                               password_confirmation: "foobar" }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try logging in before activation
    log_in_as(user)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: "wrong")
    assert_not is_logged_in?
    # Valid token and valid email
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_redirected_to releases_path
    follow_redirect!
    assert_template 'static_pages/releases'
    assert is_logged_in?
    # assert_template 'static_pages/home'
    # assert is_logged_in?
  end

  test "redirect signup when already logged in" do
    user = users(:russell)
    log_in_as(user)
    get signup_path
    assert_redirected_to releases_path
  end

end
