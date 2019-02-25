require 'rails_helper'

RSpec.describe Post, type: :model do
  context "creating post" do
    describe "each post" do
      before(:each) do
        user = User.first
        @post = user.posts.build(content: "hello", image:"image")
      end
      it "should have either text" do
        @post.image = nil
        expect(@post).to be_valid
      end
      it "should have either image" do
        @post.content = nil
        expect(@post).to be_valid
      end
      it 'should have max limit on text' do
        b = ''
        25.times do
          b += 'Hello'
        end
        @post.content = b
        expect(@post).to be_invalid
      end
      it 'should have size limit on image' do

      end
      it 'should not be empty' do
        @post.image = nil
        @post.content = nil
        expect(@post).to be_invalid
      end
      it 'should destroy Post dependent reactions' do
        a = Reaction.all.count
        b = Post.first
        b.destroy
        expect(a).to be > Reaction.all.count
      end
      it 'should destroy Post dependent comments' do
        a = Comment.all.count
        b = Post.first
        b.destroy
        expect(a).to be > Comment.all.count
      end
    end
  end
end
