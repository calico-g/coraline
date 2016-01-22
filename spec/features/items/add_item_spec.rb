require 'rails_helper'

feature 'Add new item' do

	scenario "that's numerical in nature" do

		visit root_path 
		fill_in('item_name', with: 'poops')
		choose('item_item_type_number')
		find('#submit').click
		expect(page).to have_content('poops')

	end

	scenario 'with invalid inputs' do
		
	end

end
