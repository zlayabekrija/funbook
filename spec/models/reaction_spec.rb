require 'rails_helper'

RSpec.describe Reaction, type: :model do
  it 'should check reactions on post' do
    p = Post.first
    f = p.reactions.build(user_id: p.user_id, like: true, dislike: true)
    expect(f).to be_invalid
  end
  it 'should check reactions on comment' do
    c = Comment.first
    f = c.reactions.build(user_id: c.user_id, like: true, dislike: true)
    expect(f).to be_invalid
  end
end
