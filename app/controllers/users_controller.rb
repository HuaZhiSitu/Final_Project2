class UsersController < ApplicationController
  def show
    matching_users = User.where(username: params[:username])
    @user = matching_users.first

    if @user.nil?
      redirect_to root_path, alert: "User not found!"
    else
      @bids = @user.bids.includes(:skin).order(created_at: :desc)
      render template: "users/show"
    end
  end

  def update
    matching_users = User.where(username: params[:username])
    @user = matching_users.first

    if @user.nil?
      redirect_to root_path, alert: "User not found!"
    else
      if @user.update(user_params)
        redirect_to user_profile_path(@user.username), notice: "Profile updated successfully!"
      else
        flash.now[:alert] = @user.errors.full_messages.to_sentence
        render template: "users/show"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar_url)
  end
end
