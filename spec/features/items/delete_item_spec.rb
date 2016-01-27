require 'rails_helper'

feature 'Delete an item' do
	item = FactoryGirl.create(:item)
	
	scenario "just any item", :js => true do

		visit root_path
		expect(page).to have_content('pimples')
		page.find(".delete-item").click

		a = page.driver.browser.switch_to.alert
		a.accept  # can also be a.dismiss
		# page.accept_alert 'Are you sure?' do
		#     click_button('Ok')
		# end
		expect(page).to have_no_content('pimples')

	end
end