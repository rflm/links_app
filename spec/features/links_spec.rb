require 'spec_helper'
describe 'add link process' do
	it 'adds link' do
		visit new_link_path
		fill_in 'link_title', with: 'Example link'
		fill_in 'link_url', with: 'http://example-link.com'
		fill_in 'link_description', with: 'Description'
		click_button 'Save'
		expect(page).to have_content 'Link added!'
	end
end