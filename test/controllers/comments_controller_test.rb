require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should create comment" do
    task = tasks(:rails_task)

    assert_difference "Comment.count", 1 do
      post task_comments_url(task), params: {
        comment: {
          body: "This is a request test comment.",
          user_id: users(:ahmed).id
        }
      }
    end

    assert_redirected_to task_url(task)
  end

  test "should get edit" do
    comment = comments(:first_comment)
    task = comment.task

    get edit_task_comment_url(task, comment)

    assert_response :success
  end

  test "should update comment" do
    comment = comments(:first_comment)
    task = comment.task

    patch task_comment_url(task, comment), params: {
      comment: { body: "Updated comment" }
    }

    assert_redirected_to task_url(task)
    assert_equal "Updated comment", comment.reload.body
  end

  test "should destroy comment" do
    comment = comments(:first_comment)
    task = comment.task

    assert_difference "Comment.count", -1 do
      delete task_comment_url(task, comment)
    end

    assert_redirected_to task_url(task)
  end

  test "should not create comment without a body" do
    task = tasks(:rails_task)

    assert_no_difference "Comment.count" do
      post task_comments_url(task), params: {
        comment: {
          body: "",
          user_id: users(:ahmed).id
        }
      }
    end

    assert_response :success
  end
end