require 'rails_helper'

RSpec.describe Friend, type: :model do
  it 'should have friend' do
    u = User.first
    f = u.friends.build()
    expect(f).to be_invalid
  end
  it 'should not self request' do
    u = User.first
    f = u.friends.build(friend_uid: u.id)
    expect(f).to be_invalid
  end
end
