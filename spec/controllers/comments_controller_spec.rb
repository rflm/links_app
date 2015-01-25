require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      link = FactoryGirl.create(:link)
      get :index, link_id: link.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      link = FactoryGirl.create(:link)
      get :index, link_id: link.id
      expect(response).to render_template("index")
    end

    it "loads all of the comments into @comments" do
      link = FactoryGirl.create(:link)
      comment = FactoryGirl.create(:comment)
      get :index, link_id: link.id
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      comment = FactoryGirl.create(:comment)
      link = FactoryGirl.create(:link)
      get :new, link_id: link.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
    end
  end

  describe "POST #create" do 
  end

  describe "GET #edit" do 
  end

  describe "PUT #update" do 
  end

  describe "DELETE #destroy" do
  end

end