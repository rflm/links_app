require 'spec_helper'
describe 'add link process' do
	it 'adds link' do
		visit new_link_path
		fill_in 'Title', with: 'Example link'
		fill_in 'Url', with: 'http://example-link.com'
		fill_in 'Description', with: 'Description'
		click_button 'Save'
		expect(page).to have_content 'link added'
	end
end