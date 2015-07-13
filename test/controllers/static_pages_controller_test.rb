require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Album Mate"
    @user = users(:russell)
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
    log_in_as(@user)
    get :home
    assert_redirected_to releases_path
  end

  test "should get releases" do
    begin
      get :releases
    rescue ActionView::Template::Error => e
      assert_match /undefined method `email' for nil:NilClass/, e.message
    end
    log_in_as(@user)
    get :releases
    assert_response :success
    assert_select "title", "Releases | #{@base_title}"
  end

  test "should get subscriptions" do
    get :subscriptions
    assert_redirected_to root_url
    log_in_as @user
    get :subscriptions
    assert_response :success
    assert_select "title", "Subscriptions | #{@base_title}"
  end

  test "should get settings" do
    get :settings
    assert_redirected_to root_url
    log_in_as @user
    get :settings
    assert_response :success
    assert_select "title", "Settings | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
