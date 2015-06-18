class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:friend_id])
    current_user.invite(user)
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    current_user.remove_friend(user)
    redirect_to user
  end
end
