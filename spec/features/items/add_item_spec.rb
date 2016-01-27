require 'rails_helper'

feature 'Add new item' do

	scenario "that's numerical in nature" do

		visit root_path 
		fill_in('item_name', with: 'poops')
		choose('item_item_type_number')
		find('#submit').click
		expect(page).to have_content('poops')

	end

	scenario "that's boolean in nature" do

		visit root_path 
		fill_in('item_name', with: 'smoked pot today?')
		choose('item_item_type_boolean')
		find('#submit').click
		expect(page).to have_content('smoked pot today?')

	end

	scenario "that's rangean in nature" do

		visit root_path 
		fill_in('item_name', with: 'happiness level')
		choose('item_item_type_scale')
		find('#submit').click
		expect(page).to have_content('happiness level')

	end

	scenario 'with invalid name' do

		visit root_path
		choose('item_item_type_number')
		find('#submit').click
		expect(page).to have_content("Name can't be blank")

	end

	scenario 'with invalid type' do

		visit root_path
		fill_in('item_name', with: 'poop in a bag')
		find('#submit').click
		expect(page).to have_content("Item type pick a thing!!!!")
		
	end
end
