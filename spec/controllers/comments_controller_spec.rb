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
      comment = FactoryGirl.create(:comment, link_id: link.id)
      get :index, link_id: link.id
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #new" do
    before :each do 
      controller.class.skip_before_filter :logged_in_user
      @link = FactoryGirl.create(:link)
    end

    it "responds successfully with an HTTP 200 status code" do     
      get :new, link_id: @link
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new, link_id: @link
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do       
    end

    it "assigns the requested user to @user" do
    end

    it "renders the #edit view" do      
    end  
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new link" do
      end

      it "redirects to the new link" do
      end
    end

    context "with invalid attributes" do
      it "does not save the new link" do
      end

      it "re-renders the new method" do
      end
    end 
  end

  describe "PUT #update" do
    context "valid attributes" do
      it "located the requested @link" do     
      end

      it "changes @link's attributes" do
      end

      it "redirects to the updated link" do
      end
    end

    context "invalid attributes" do
      it "located the requested @link" do     
      end

      it "does not change @link's attributes" do
      end

      it "re-renders the edit method" do
      end

    end 
  end

  describe "DELETE #destroy" do
    it "deletes the link" do
    end

    it "redirects to the links#index" do
    end
  end

end