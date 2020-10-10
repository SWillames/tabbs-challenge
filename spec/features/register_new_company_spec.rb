require 'rails_helper'

feature 'Register new company' do
    let(:company) { create(:company) } 
    scenario 'from home page' do
        visit root_path
        click_on 'New company'

        expect(current_path).to eq new_company_path  
    end

    scenario 'successfully' do
        visit root_path
        click_on 'New company'

        fill_in "name",	with: company.name
        fill_in "Corporate name",	with: company.corporate_name
        fill_in "Cnpj",	with: company.cnpj
        fill_in "Address",	with: company.address
        fill_in "Domain",	with: company.domain
        click_on 'Create Company'

        expect(current_path).to eq new_user_registration_path
    end
end