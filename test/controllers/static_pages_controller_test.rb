require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Album Mate"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get subscriptions" do
    get :subscriptions
    assert_response :success
    assert_select "title", "Subscriptions | #{@base_title}"
  end

  test "should get settings" do
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
