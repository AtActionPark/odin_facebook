class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      flash[:success] ='Commented'
      redirect_to root_path
    else
      flash[:error] ='Error'
      redirect_to root_path
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:post_id, :content)
    end
end
