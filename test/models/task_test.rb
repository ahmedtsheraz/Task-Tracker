require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should not save task without a title" do
    task = Task.new(status: "pending", user: users(:ahmed))

    assert_not task.save
  end

  test "should require a valid status" do
    task = Task.new(
      title: "Test Task",
      status: "invalid",
      user: users(:ahmed)
    )

    assert_not task.save
  end

  test "should save task with valid attributes" do
    task = Task.new(
      title: "New Task",
      description: "Testing task creation",
      status: "pending",
      user: users(:ahmed)
    )

    assert task.save
  end

  test "should belong to a user" do
    assert_equal users(:ahmed), tasks(:rails_task).user
  end

  test "should have many comments" do
    assert_equal 2, tasks(:rails_task).comments.count
  end

  test "should destroy associated comments when destroyed" do
    task = tasks(:rails_task)

    assert_difference "Comment.count", -2 do
      task.destroy
    end
  end
end