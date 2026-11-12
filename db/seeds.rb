# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Users and their tasks

users_data = [
  {
    name: "Sheraz Ahmed",
    email: "ahmed@example.com",
    tasks: [
      {
        title: "Learn Rails associations",
        description: "Practice has_many and belongs_to",
        status: "completed",
        due_date: Date.current + 2.days
      },
      {
        title: "Practice Active Record queries",
        description: "Work with querying methods",
        status: "in_progress",
        due_date: Date.current + 5.days
      }
    ]
  },
  {
    name: "Ali Khan",
    email: "ali@example.com",
    tasks: [
      {
        title: "Build a blog application",
        description: "Create a basic blog using Rails",
        status: "pending",
        due_date: Date.current + 7.days
      },
      {
        title: "Learn Rails validations",
        description: "Practice model validations",
        status: "completed",
        due_date: Date.current + 1.day
      }
    ]
  },
  {
    name: "Sara Ahmed",
    email: "sara@example.com",
    tasks: [
      {
        title: "Study Rails callbacks",
        description: "Practice Active Record callbacks",
        status: "in_progress",
        due_date: Date.current + 3.days
      },
      {
        title: "Practice database migrations",
        description: "Create and modify database tables",
        status: "pending",
        due_date: Date.current + 10.days
      }
    ]
  }
]

users_data.each do |user_data|
  user = User.find_or_create_by!(email: user_data[:email]) do |u|
    u.name = user_data[:name]
  end

  user_data[:tasks].each do |task_data|
    user.tasks.find_or_create_by!(title: task_data[:title]) do |task|
      task.description = task_data[:description]
      task.status = task_data[:status]
      task.due_date = task_data[:due_date]
    end
  end
end