require 'rails_helper'

RSpec.describe Friend, type: :model do
    before(:all) do
        @friend = build(:friend)
    end
    it 'should have friend' do
    expect(@friend).to be_invalid
  end
  it 'should not self request' do
    friend = build(:friend,friend_uid: @friend.id)
    expect(friend).to be_invalid
  end
end
