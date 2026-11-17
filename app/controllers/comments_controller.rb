class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @task
    else
      @comments = @task.comments.includes(:user).to_a
      render "tasks/show"
    end
  end

  def edit
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy

    redirect_to @task
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end