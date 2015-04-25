require 'rails_helper'

feature 'dishes' do

  context 'no dishes added yet' do
    scenario 'should display a prompt to add a dish' do
      visit '/'
      expect(page).to have_content 'No dish added yet'
      expect(page).to have_button 'Add a dish'
    end
  end

end
