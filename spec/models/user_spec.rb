require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid if the level isn\'t between 1 and 99' do
    expect(User.create(nickname: 'Padauan', kind: :wizard, level: 100)).not_to be_valid
  end
  it 'return the correct hero title' do
    user1 = User.create(nickname: 'Vocoder', kind: :knight, level: 1)
    expect(user1.title).to eq("knight Vocoder 1")
  end
end
