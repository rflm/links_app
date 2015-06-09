require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	it "should have a current_user" do
		@user = FactoryGirl.create(:user)
		sign_in(:user, @user)
    expect(subject.current_user).not_to be_nil
  end

  it "should get index" do
    get 'index'
    expect(response).to be_success
  end
end
