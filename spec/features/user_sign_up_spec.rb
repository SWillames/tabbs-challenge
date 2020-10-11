require 'rails_helper'

feature 'User sign up' do
    let(:user) { build(:user, company: create(:company)) } 
    scenario 'from home page' do
        visit root_path
        expect(page).to have_link('Signup')  
    end

    scenario 'successfully' do
        name = user.company.name
        visit root_path
        click_on 'Signup'

        fill_in "Name",	with:  user.name
        fill_in "Email", with: user.email
        fill_in "Password",	with: user.password
        fill_in "Password confirmation", with: user.password
        select "#{name}", from: 'user_company_id'
        click_on 'Sign Up'

        expect(page).to have_content("Olá, #{user.name}")
        expect(page).to have_link("Sign out") 

    end
end