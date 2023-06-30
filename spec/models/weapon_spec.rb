require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it 'check if the weapon has a name' do
    weapon1 = build(:weapon)
    expect(weapon1.weaponname).to be_truthy
  end

  it 'return the correct title of the weapon' do
    name = FFaker::Name.first_name
    lvl = FFaker::Random.rand(1..99)
    weapon = Weapon.create(weaponname: name, level: lvl)
    expect(weapon.title).to eq("#{weapon.weaponname} ##{weapon.level}")
  end
end
