require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
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

    it "loads all of the users into @users" do
      user = FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do 
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do 
    it "responds successfully with an HTTP 200 status code" do 
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    before :each do
      controller.class.skip_before_filter :correct_user
      @user = FactoryGirl.create(:user)
    end

    it "responds successfully with an HTTP 200 status code" do 
      get :edit, id: @user
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns the requested user to @user" do
      get :edit, id: @user
      expect(assigns(:user)).to eq(@user)
    end

    it "renders the #edit view" do
      get :edit, id: FactoryGirl.create(:user, email: "dd@pp.eu")
      expect(response).to render_template :edit
    end      
  end

  describe "POST #create" do 
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to the new user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to User.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "re-renders the new method" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end

  end

  describe "PUT #update" do
    before :each do
      controller.class.skip_before_filter :correct_user
      @user = FactoryGirl.create(:user)
    end

    context "valid attributes" do
      it "located the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(@user)      
      end

      it "changes @user's attributes" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user,
        name: "user")
        @user.reload
        expect(@user.name).to eq("user")
      end

      it "redirects to the updated user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to @user
      end
    end

    context "invalid attributes" do
      it "located the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(assigns(:user)).to eq(@user)      
      end

      it "does not change @user's attributes" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, 
        name: "foo", email: nil)
        @user.reload
        expect(@user.name).to_not eq("foo")
        expect(@user.email).to eq("example@email.com")
      end

      it "re-renders the edit method" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      controller.class.skip_before_filter :admin_user
      @user = FactoryGirl.create(:user)
    end

    it "deletes the user" do      
      expect {
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_url
    end
  end
end