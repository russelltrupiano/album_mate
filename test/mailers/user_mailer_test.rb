require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user  = users(:russell)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Albumate account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@albumatedevs.com"], mail.from
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

  test "password_reset" do
    user  = users(:russell)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Albumate password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@albumatedevs.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

  test "new_album_notification" do
    user  = users(:russell)
    album = nil
    mail = UserMailer.new_album_notification(user, album)
    assert_equal "New album released!", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@albumatedevs.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
