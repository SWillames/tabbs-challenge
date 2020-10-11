require 'ffaker'
FactoryBot.define do
  factory :post do
    user { create(:user) }
    body { FFaker::Lorem.paragraphs }
  end
end
