require 'rails_helper'

feature 'User sign in' do
  let(:user) { create(:user) }
  scenario 'from home page' do
    visit root_path
    expect(page).to have_link('Sign_in')
  end
  
  scenario 'successfully' do
    visit root_path
    click_on 'Sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    expect(page).to have_content "Olá, #{user.name}"
    expect(page).to have_content "Signed in successfully"
    expect(page).to have_link 'Sign out'
    expect(page).not_to have_link 'Sign in'
  end
end