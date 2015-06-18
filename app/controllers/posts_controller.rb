class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
