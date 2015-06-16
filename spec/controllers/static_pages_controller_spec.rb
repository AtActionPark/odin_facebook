require 'rails_helper'


RSpec.describe StaticPagesController, type: :controller do

  before :all do
    @base_title = "OdinFacebook"
  end

  describe "GET #home" do
    render_views
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "asserts title is ok"  do
      get :home
      assert_select "title", "#{@base_title} | Home"
    end
  end


  describe "GET #help" do
    render_views
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    it "asserts title is ok"  do
      get :help
      assert_select "title", "#{@base_title} | Help"
    end
  end

  describe "GET #about" do
    render_views
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "asserts title is ok"  do
      get :about
      assert_select "title", "#{@base_title} | About"
    end
  end


end

