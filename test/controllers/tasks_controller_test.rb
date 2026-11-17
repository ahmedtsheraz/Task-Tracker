require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:ahmed)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should show task" do
    get task_url(tasks(:rails_task))
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference "Task.count", 1 do
      post tasks_url, params: {
        task: {
          title: "New test task",
          description: "Created through request test",
          status: "pending",
          due_date: "2026-12-01"
        }
      }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should get edit" do
    get edit_task_url(tasks(:rails_task))
    assert_response :success
  end

  test "should update task" do
    patch task_url(tasks(:rails_task)), params: {
      task: { title: "Updated task title" }
    }

    assert_redirected_to task_url(tasks(:rails_task))
    assert_equal "Updated task title", tasks(:rails_task).reload.title
  end

  test "should destroy task" do
    assert_difference "Task.count", -1 do
      delete task_url(tasks(:rails_task))
    end

    assert_redirected_to tasks_url
  end

  test "should assign task to current user" do
    assert_difference "Task.count", 1 do
      post tasks_url, params: {
        task: {
          title: "Ahmed's new task",
          description: "Testing current user assignment",
          status: "pending",
          due_date: "2026-12-01"
        }
      }
    end

    assert_equal users(:ahmed), Task.last.user
  end
end