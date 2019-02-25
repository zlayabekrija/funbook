require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "creating" do
    describe "to check validation" do
      before(:each) do
        post = Post.first
        @comment = post.comments.build(content: "This is comment", user_id: post.user_id )
      end
      it 'should check for presence' do
        expect(@comment).to be_valid
      end
      it 'should has max length' do
        b = ''
        25.times do
          b += 'Hello'
        end
        @comment.content = b
        @comment.valid?
        expect(@comment.errors[:content]).to include("is too long (maximum is 120 characters)")
      end
      it 'should destroy Comment dependent reactions' do
        a = Reaction.all.count
        b = Comment.first
        b.destroy
        expect(a).to be > Reaction.all.count
      end
    end
  end
end
