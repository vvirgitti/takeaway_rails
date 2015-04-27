require 'rails_helper'

feature 'dishes' do

  context 'no dishes added yet' do
    scenario 'should display a prompt to add a dish' do
      visit '/dishes'
      expect(page).to have_content 'No dish added yet'
      expect(page).to have_button 'Add a dish'
    end
  end


  context "creating a new dish" do
    scenario "should display a promt to create a new dish, then display that dish" do
      visit '/dishes'
      click_on 'Add a dish'
      fill_in 'Name', with: 'Shrimp Tempura'
      fill_in 'Price', with: 10
      click_button 'Create Dish'
      expect(page).to have_content("Shrimp Tempura")
      expect(page).to have_content 10
      expect(current_path).to eq '/dishes'
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

  context "viewing dishes" do
    let!(:tempura){Dish.create(name:"tempura", price:10)}

    scenario "lets user views a dish" do
      visit '/dishes'
      click_link 'tempura'
      expect(page).to have_content('tempura 10')
      expect(current_path).to eq "/dishes/#{tempura.id}"
    end
  end

end
