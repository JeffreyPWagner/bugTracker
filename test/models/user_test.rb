require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "happy path" do
    user = User.new()
    user.lname = "test"
    user.fname = "test"
    user.email = "email@mail.com"
    user.thumbnail = "thumbnail.jpg"
    assert user.valid?
  end

  test "confirm validation" do
    user = User.new
    assert_not user.valid?
    assert_equal [:lname, :fname, :email], user.errors.keys
  end

  test "email format correct" do
    user = User.new()
    user.lname = "test"
    user.fname = "test"
    user.email = "bad email"
    assert_not user.valid?
    assert_equal [:email], user.errors.keys
  end

  test "email unique" do
    user = User.new()
    user.lname = "test"
    user.fname = "test"
    user.email = "email@mail.com"
    user.save
    user2 = User.new()
    user2.lname = "test"
    user2.fname = "test"
    user2.email = "email@mail.com"
    assert_not user2.valid?
    assert_equal [:email], user2.errors.keys
  end

  test "thumbnail valid format" do
    user = User.new()
    user.lname = "test"
    user.fname = "test"
    user.email = "email@mail.com"
    user.thumbnail = "badthumb"
    assert_not user.valid?
    assert_equal [:thumbnail], user.errors.keys
    user.thumbnail = "goodthumb.jpg"
    assert user.valid?
    user.thumbnail = "goodthumb.png"
    assert user.valid?
    user.thumbnail = "goodthumb.gif"
    assert user.valid?
  end
end
