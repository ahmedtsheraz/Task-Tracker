require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without a body" do
    comment = Comment.new(task: tasks(:rails_task), user: users(:ahmed))

    assert_not comment.save
  end

  test "should save comment with valid attributes" do
    comment = Comment.new(
      body: "This is a test comment.",
      task: tasks(:rails_task),
      user: users(:ahmed)
    )

    assert comment.save
  end

  test "should belong to a task" do
    assert_equal tasks(:rails_task), comments(:first_comment).task
  end

  test "should belong to a user" do
    assert_equal users(:ali), comments(:first_comment).user
  end

  test "should be destroyed when its task is destroyed" do
    comment = comments(:first_comment)
    task = comment.task

    assert_difference "Comment.count", -2 do
      task.destroy
    end
  end
end