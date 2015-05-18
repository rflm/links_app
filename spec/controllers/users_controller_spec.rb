require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	it "should have a current_user" do
		@user = FactoryGirl.create(:user)
		sign_in(:user, @user)
    subject.current_user.should_not be_nil
  end

  it "should get index" do
    get 'index'
    response.should be_success
  end
end
