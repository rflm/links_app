require 'spec_helper'
describe 'the signin process' do
	it 'signs me in' do
		FactoryGirl.create(:user)
		visit new_user_session_path
		fill_in 'Email', with: 'example@email.com'
		fill_in 'Password', with: 'password'
		click_button 'Log in'
		expect(page).to have_content 'Steve'
	end

	it 'shows errors' do
		FactoryGirl.create(:user)
		visit new_user_session_path
		fill_in 'Email', with: 'example@email.com'
		fill_in 'Password', with: 'password123'
		click_button 'Log in'
		expect(page).to have_content 'Invalid email or password'
	end
end

describe 'the signup process' do
	it 'signs me up' do
		visit 'users/sign_up'
		fill_in 'Name', with: 'John'
		fill_in 'Email', with: 'user@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_button 'Sign up'
		expect(page).to have_content 'John'
	end

	it 'shows errors' do
		visit 'users/sign_up'
		fill_in 'Name', with: 'John'
		fill_in 'Email', with: 'user@example.com'
		click_button 'Sign up'
		expect(page).to have_content "Password can't be blank"
	end
end
