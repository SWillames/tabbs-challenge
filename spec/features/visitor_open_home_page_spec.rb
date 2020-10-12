require 'rails_helper'

feature 'Visitor open home page' do
    scenario 'successfully' do
      visit root_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
end