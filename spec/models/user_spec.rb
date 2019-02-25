require 'rails_helper'

RSpec.describe User, type: :model do
  context "creating" do
    describe "validation" do
      before(:each) do
        @user = User.new(name: 'Tom', email: 'tom1@tom.com', dob: '1980-02-02', password: '123456')
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
      it 'should check validity' do
        @user.dob = '2019-03-02'
        expect(@user).to be_invalid
      end
      it 'should check_dob error' do
        @user.valid?
        expect(@user.errors[:dob]).not_to be_nil
      end
      it 'should destroy dependent post' do
        a = Post.all.count
        b = User.first
        b.destroy
        expect(a).to be > Post.all.count
      end
      it 'should destroy dependent comments through post' do
        a = Comment.all.count
        b = User.first
        b.destroy
        expect(a).to be > Comment.all.count
      end
      it 'should destroy dependent reactions through post/comment' do
        a = Reaction.all.count
        b = User.first
        b.destroy
        expect(a).to be > Reaction.all.count
      end
      it 'should destroy dependent friends' do
        a = Friend.all.count
        b = User.first
        b.destroy
        expect(a).to be > Friend.all.count
      end
    end
  end
end
