require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    let(:user) { create(:user) } 
    it { is_expected.to validate_presence_of(:name) } 
    
    it 'expected validate uniqueness of email' do
      user1 = build(:user, email: user.email)
      expect validate_uniqueness_of(:email)
      expect(user1).not_to be_valid
      expect(user1.errors[:email]).to be_present
    end
  end
  
  context "association" do
    it { is_expected.to (:company) }
  end
end
