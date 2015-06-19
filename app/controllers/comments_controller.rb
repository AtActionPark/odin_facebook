class CommentsController < ApplicationController
  before_filter :redirect_back
  
  def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      flash[:success] ="Commented "
      redirect_to session[:my_previous_url]
    else
      flash[:error] ='Error'
      redirect_to root_path
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:post_id, :content)
    end

    def redirect_back
      session[:my_previous_url] = URI(request.referer).path
    end
end
