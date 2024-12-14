class UsersController < ApplicationController
  def show
    matching_users = User.where(username: params[:username])
    @user = matching_users.at(0)

    if @user.nil?
      redirect_to root_path, alert: "User not found!"
    else
      @bids = @user.bids.includes(:skin).order(created_at: :desc)
      render template: "users/show"
    end
  end
end
