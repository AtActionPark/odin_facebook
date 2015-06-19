class LikesController < ApplicationController
  before_filter :redirect_back
  
  def create
    @like = current_user.likes.build(likeable: @likeable)
    @like.likeable =  find_likeable

    if @like.save
      flash[:success] = "Liked!"
      redirect_to session[:my_previous_url]
    else
      flash[:error] = "Error"
      redirect_to session[:my_previous_url]
    end
  end

  def find_likeable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  private
    def redirect_back
      session[:my_previous_url] = URI(request.referer).path
    end

end
