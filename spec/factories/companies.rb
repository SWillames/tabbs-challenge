require 'ffaker'

FactoryBot.define do
  factory :company do
    name { FFaker::Company.name }
    corporate_name { name + " " + FFaker::Company.suffix }
    cnpj { FFaker::IndetificationBR.cnpj }
    address { FFaker::AddressBR.full_address }
    domain { FFaker::InternetSE.domain_name }
  end
end
