require 'rails_helper'

feature 'dishes' do

  context 'no dishes added yet' do
    scenario 'should display a prompt to add a dish' do
      visit '/'
      expect(page).to have_content 'No dish added yet'
      expect(page).to have_button 'Add a dish'
    end
  end

  context "dishes have been added" do

    before do
      Dish.create(name: 'Shrimp Tempura', price:10)
    end

    scenario "should display all dishes" do
      visit '/dishes'
      expect(page).to have_content "Shrimp Tempura"
      expect(page).to have_content 10
      expect(page).not_to have_content "No dish added yet"
    end
  end

end
