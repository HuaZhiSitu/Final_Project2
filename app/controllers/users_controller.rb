class UsersController < ApplicationController
  def show
    matching_users = User.where(username: params[:username])
    @user = current_user

    if @user.nil?
      redirect_to root_path, alert: "User not found!"
    else
      @bids = @user.bids.includes(:skin).order(created_at: :desc)
      render template: "users/show"
    end
  end
end
