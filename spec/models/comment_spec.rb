require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "creating" do
    describe "to check validation" do
      before(:all) do
        @comment = build(:comment)
      end
      it 'should check for presence' do
        expect(@comment).to be_valid
      end
      it 'should has max length' do
        b = ''
        25.times do
          b += 'Hello'
        end
        comment = build(:comment,content: b)
        comment.valid?
        expect(comment.errors.messages[:content]).to include("is too long (maximum is 120 characters)")
      end
    end
  end
end
