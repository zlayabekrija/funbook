require 'rails_helper'

RSpec.describe Reaction, type: :model do
  it 'should check reactions on post' do
    reaction = create(:reaction, :for_post)
    expect(reaction).to be_valid
  end
  it 'should check reactions on comment' do
    reaction = create(:reaction, :for_comment,dislike: true)
    expect(reaction).not_to be_invalid
  end
end
