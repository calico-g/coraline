require 'rails_helper'

feature 'Edit trace data' do
  before(:all) do
    visit root_path
  end

	scenario "that's numerical in nature" do
		item = FactoryGirl.create(:item)
		puts item.name

		expect(page).to have_content('pimples')
		fill_in('trace[][input]', with: 3)
		fill_in('trace[][notes]', with: "such is life")
		choose('item_item_type_number')
		find('#submit').click
		expect(page).to have_content('yay!!!')

	end

	# scenario "that's boolean in nature" do

	# 	visit root_path 
	# 	fill_in('item_name', with: 'smoked pot today?')
	# 	choose('item_item_type_boolean')
	# 	find('#submit').click
	# 	expect(page).to have_content('smoked pot today?')

	# end

	# scenario "that's rangean in nature" do

	# 	visit root_path 
	# 	fill_in('item_name', with: 'happiness level')
	# 	choose('item_item_type_scale')
	# 	find('#submit').click
	# 	expect(page).to have_content('happiness level')

	# end

end
