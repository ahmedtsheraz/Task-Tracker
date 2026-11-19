class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def tasks
    @user = current_user
    @tasks = @user.tasks
  end

  def destroy
    current_user.destroy
    sign_out(:user)

    redirect_to new_user_session_path, notice: "Your account has been deleted."
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
