require 'rails_helper'

RSpec.describe User, type: :model do
  context "creating" do
    describe "validation" do
      before(:all) do
        @user1 = build(:user)
      end
      it 'should check validity' do
        expect(@user1).to be_valid 
      end
      it 'should check name presence' do
        @user1 = build(:user, name: nil)
        expect(@user1).not_to be_valid
      end
      it 'should check name length' do
        user1 = build(:user, name: 'al')
        user1.valid?
        expect(user1.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
      end
      it 'should check dob' do
        user1 = build(:user, dob: '2029-03-02')
        user1.valid?
        expect(user1.errors.messages[:dob]).to include("can't be in future")
      end
      it 'should check validity' do
        user1 = build(:user, dob: '2049-03-02')
        user1.valid?
        expect(user1).to be_invalid
      end
      it 'should check_dob error' do
        user1 = build(:user, dob: nil)
        expect(user1.errors.messages[:dob]).not_to be_nil
      end

      it 'adds default image' do
        user = create(:user)
        expect(user.profile_pic).not_to be_nil
      end
     
    end
  end
end
