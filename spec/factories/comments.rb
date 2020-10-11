require 'ffaker'
FactoryBot.define do
  factory :comment do
    user { create(:user) }
    body { FFaker::Lorem.paragraphs }
    commentable { nil }
  end
end
