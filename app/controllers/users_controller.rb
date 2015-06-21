
class UsersController < ApplicationController
  before_action :authenticate_user!, :except => :new
  before_action  :correct_user?, :only => :inviters
  


  def new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

   def friends
    @title = "Friends"
    @user  = User.find(params[:id])
    @users = @user.friends.paginate(page: params[:page])
    render 'show_friends'
  end

  
  def inviters
    @id = params[:id]
    @inviters = User.find(@id).inviters
  end

  def accept_invite
    inviter_id = params[:inviter_id]
    id = params[:id]
    user = User.find(id)
    invite = FriendRequest.find_request(inviter_id, id)
    invite.destroy
    user.add_friend(User.find(inviter_id))
    redirect_to inviters_user_path
  end

  private
    def correct_user? 
      redirect_to root_path unless current_user == User.find(params[:id])
    end
end
