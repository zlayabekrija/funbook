require 'rails_helper'

RSpec.describe Post, type: :model do
  context "creating post" do
    describe "each post" do
      before(:all) do
        @post = build(:post)
      end
      it "should have either text" do
        expect(@post).to be_valid
      end
      it "should have either image" do
        post = build(:post, content: nil)
        post.post_pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "male.png")), filename: 'male.png' , content_type: "image/jpg")
        expect(post).to be_valid
      end
      it 'should have max limit on text' do
        b = ''
        25.times do
          b += 'Hello'
        end
        post = build(:post,content: b)
        expect(post).to be_invalid
      end

      it 'should not be empty' do
        post = build(:post,content: nil)
        post.post_pic.attach(nil)

        expect(post).to be_invalid
      end

    end
  end
end
