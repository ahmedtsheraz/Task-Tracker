require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should switch current user" do
    post switch_users_url, params: {
      user_id: users(:ali).id
    }

    assert_equal users(:ali).id, session[:current_user_id]
    assert_redirected_to users_url
  end

  test "should show user's tasks" do
    get tasks_user_url(users(:ahmed))

    assert_response :success
    assert_select "h1", "Tasks for #{users(:ahmed).name}"
    assert_select "td", text: tasks(:rails_task).title
  end

  test "should show empty message when user has no tasks" do
    user = User.create!(
      name: "New User",
      email: "newuser@example.com"
    )

    get tasks_user_url(user)

    assert_response :success
    assert_select "p", "This user has no tasks yet."
  end
end
