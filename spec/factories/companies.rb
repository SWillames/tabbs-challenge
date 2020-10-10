require 'ffaker'

FactoryBot.define do
  factory :company do
    name { FFaker::Company.name }
    corporate_name { name + " " + FFaker::Company.suffix }
    cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    address { FFaker::AddressBR.full_address }
    domain { FFaker::InternetSE.domain_name }
  end
end
