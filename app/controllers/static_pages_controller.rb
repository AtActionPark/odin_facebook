class StaticPagesController < ApplicationController

  before_action :authenticate_user!, :except => [:home, :help, :about, :contact]
  
  def home
  end

  def help
  end

  def about

  end

  def contact
  end

end
