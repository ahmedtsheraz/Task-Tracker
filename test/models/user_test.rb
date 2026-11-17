require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without a name" do
    user = User.new(
      name: "",
      email: "test@example.com",
      password: "123456"
    )

    assert_not user.save
  end

  test "should not save user without an email" do
    user = User.new(
      name: "Test User",
      email: "",
      password: "123456"
    )

    assert_not user.save
  end

  test "should require unique email addresses" do
    user = User.new(
      name: "Another User",
      email: users(:ahmed).email,
      password: "123456"
    )

    assert_not user.save
  end

  test "should normalize name before saving" do
    user = User.create!(
      name: "john doe",
      email: "john@example.com",
      password: "123456"
    )

    assert_equal "John Doe", user.name
  end

  test "should have many tasks" do
    assert_equal 1, users(:ahmed).tasks.count
  end
end