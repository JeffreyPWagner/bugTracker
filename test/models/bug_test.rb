require 'test_helper'

class BugTest < ActiveSupport::TestCase

  test "happy path" do
    user = User.new()
    user.lname = "test"
    user.fname = "test"
    user.email = "email@mail.com"
    user.save
    bug = Bug.new
    bug.title = "title"
    bug.description = "desc"
    bug.user = user
    assert bug.valid?
  end

  test "confirm validation" do
    bug = Bug.new
    assert_not bug.valid?
    assert_equal [:user, :title, :description], bug.errors.keys
  end

  test "issue type valid" do
    assert_raises(Exception) {bug = Bug.new(issue_type: 3)}
  end

  test "priority valid" do
    assert_raises(Exception) {bug = Bug.new(priority: 3)}
  end

  test "status valid" do
    assert_raises(Exception) {bug = Bug.new(status: 3)}
  end

  test "default issue type" do
    bug = Bug.new()
    assert bug.feature?
  end

  test "default priority" do
    bug = Bug.new()
    assert bug.medium?
  end

  test "default status" do
    bug = Bug.new()
    assert bug.open?
  end

end
