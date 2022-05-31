require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "new_order_email" do
    mail = OrderMailer.new_order_email
    assert_equal "Account activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
