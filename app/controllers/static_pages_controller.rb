class StaticPagesController < ApplicationController

  before_action :authenticate_user!, :except => [:home, :help, :about, :contact]
  
  def home
    @post = current_user.posts.build if user_signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page]) if user_signed_in?
  end

  def help
  end

  def about

  end

  def contact
  end

end
