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
    it "responds successfully with an HTTP 200 status code" do
      link = FactoryGirl.create(:link) 
      get :edit, id: link.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      link = FactoryGirl.create(:link)
      get :edit, id: link.id
      expect(response).to render_template("edit")
    end
  end

  describe "PUT #update" do
    before :each do
      @link = FactoryGirl.create(:link, title: "test_title", url: "http://example.com")
    end

    context "valid attributes" do
      it "located the requested @link" do
        put :update, id: @link, link: FactoryGirl.attributes_for(:link)
        expect(assigns(:link)).to eq(@link)
      end

      it "changes @link's attributes" do
        put :update, id: @link,
          link: FactoryGirl.attributes_for(:link, title: "test_title", url: "http://example.com")
        @link.reload
        expect(@link.title).to eq("test_title")
        expect(@link.url).to eq("http://example.com")  
      end

      it "redirects to the updated link" do
        put :update, id: @link, link: FactoryGirl.attributes_for(:link)
        expect(response).to redirect_to @link
      end
    end

    context "invalid attributes" do
      it "locates the requested @link" do
        put :update, id: @link, link: FactoryGirl.attributes_for(:invalid_link)
        expect(assigns(:link)).to eq(@link)
      end

      it "does not change @link's attributes" do
        put :update, id: @link,
          link: FactoryGirl.attributes_for(:link, title: "bad_test_title", url: nil)
        @link.reload
        expect(@link.title).to_not eq("bad_test_title")
        expect(@link.url).to eq("http://example.com")  
      end

      it "re-renders the edit method" do
        put :update, id: @link, link: FactoryGirl.attributes_for(:invalid_link)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @link = FactoryGirl.create(:link)
    end

    it "deletes the link" do
      expect {
        delete :destroy, id: @link
      }.to change(Link, :count).by(-1)
    end

    it "redirect_to links#index" do
      delete :destroy, id: @link
      expect(response).to redirect_to links_url
    end
  end
end
