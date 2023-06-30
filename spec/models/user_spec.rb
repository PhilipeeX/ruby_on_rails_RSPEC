require 'rails_helper'
require 'ffaker'

RSpec.describe User, type: :model do
  it 'is invalid if the level isn\'t between 1 and 99' do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(100..999)
    user = User.new(nickname: nickname, kind: kind, level: level)
    expect(user).not_to be_valid
  end
  it 'return the correct hero title' do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(1..99)
    user1 = User.create(nickname: nickname, kind: kind, level: level)
    expect(user1.title).to eq("#{kind} #{nickname} #{level}")
  end
end
