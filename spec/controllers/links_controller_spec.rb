require 'rails_helper'

RSpec.describe LinksController, :type => :controller do  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the links into @links" do
      link = FactoryGirl.create(:link)
      get :index
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET #show" do 
    it "responds successfully with an HTTP 200 status code" do 
      link = FactoryGirl.create(:link)
      get :show, id: link.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      link = FactoryGirl.create(:link)
      get :show, id: link.id
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do 
    it "responds successfully with an HTTP 200 status code" do 
      link = FactoryGirl.create(:link)
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      link = FactoryGirl.create(:link)
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do 
    context "with valid attributes" do
      it "creates a new link" do
        expect {
          post :create, link: FactoryGirl.attributes_for(:link)
        }.to change(Link, :count).by(1)
      end

      it "redirects to the new link" do
        post :create, link: FactoryGirl.attributes_for(:link)
        expect(response).to redirect_to Link.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new link" do
        expect {
          post :create, link: FactoryGirl.attributes_for(:invalid_link)
        }.to_not change(Link, :count)
      end

      it "re-renders the new method" do
        post :create, link: FactoryGirl.attributes_for(:invalid_link)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    
  end

  describe "PUT #update" do

  end

  describe "DELETE #destroy" do
    
  end
end
