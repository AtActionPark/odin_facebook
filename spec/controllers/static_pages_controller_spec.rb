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
      assert_select "title", "#{@base_title} | Home"
    end
  end


  describe "GET #help" do
    render_views
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      assert_select "title", "#{@base_title} | Help"
    end
  end

  describe "GET #about" do
    render_views
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      assert_select "title", "#{@base_title} | About"
    end
  end

  describe "GET #contact" do
    render_views
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
      assert_select "title", "#{@base_title} | Contact"
    end
  end


end

