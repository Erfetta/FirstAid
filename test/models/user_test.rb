require "test_helper"

class User2Test < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(password: "password123", password_confirmation: "password123")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without password" do
    user = User.new(email: "testuser@example.com")
    assert_not user.save, "Saved the user without a password"
  end

  test "should save user with valid attributes" do
    user = User.new(
      email: "testuser@example.com",
      password: "password123",
      password_confirmation: "password123",
      name: "Test",
      surname: "User",
      sex: "M",
      age: 30
    )
    assert user.save, "Could not save the user with valid attributes"
  end

  test "should validate password confirmation" do
    user = User.new(
      email: "testuser@example.com",
      password: "password123",
      password_confirmation: "wrongpassword"
    )
    assert_not user.save, "Saved the user with mismatched password and confirmation"
  end
end
