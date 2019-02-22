require 'rails_helper'

RSpec.describe User, type: :model do
  context "creating users" do
    describe "validation" do
      before(:each) do
        @user = User.new(name: 'Tom', email: 'tom@tom.com', dob: '1980-02-02', password: '123456')
      end
      it 'should check validity' do
        expect(@user).to be_valid
      end
      it 'should check name presence' do
        @user.name = nil
        expect(@user).not_to be_valid
      end
      it 'should check name length' do
        @user.name = 'al'
        @user.valid?
        expect(@user.errors[:name]).to include("is too short (minimum is 3 characters)")
      end
      it 'should check dob' do
        @user.dob = '2019-03-02'
        @user.valid?
        expect(@user.errors[:dob]).to include("can't birth in future")
      end
    end
  end
end
