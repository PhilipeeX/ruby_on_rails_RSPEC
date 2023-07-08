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

  describe 'validations' do
    it 'validates that level is greater than 0' do
      weapon = Weapon.new(level: 0)
      expect(weapon).not_to be_valid
      expect(weapon.errors[:level]).to include('must be greater than 0')
    end

    it 'validates that level is less than or equal to 99' do
      weapon = Weapon.new(level: 100)
      expect(weapon).not_to be_valid
      expect(weapon.errors[:level]).to include('must be less than or equal to 99')
    end

    it 'validates the numericality of level' do
      weapon = Weapon.new(level: 'invalid')
      expect(weapon).not_to be_valid
      expect(weapon.errors[:level]).to include('is not a number')
    end
  end

  describe '#current_power' do
    it 'calculates the correct current power' do
      weapon = Weapon.new(level: 10, power_base: 5, power_step: 2)
      expect(weapon.current_power).to eq(23)
    end
    it 'calculates the correct current power for level 1' do
      weapon = Weapon.new(level: 1, power_base: 5, power_step: 2)
      expect(weapon.current_power).to eq(5)
    end
  end

  describe '#title' do
    it 'returns the correct title when weaponname is present' do
      weapon = Weapon.new(weaponname: 'Sword', level: 5)
      expect(weapon.title).to eq('Sword #5')
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      weapon = Weapon.new(weaponname: 'Sword', level: 5)
      expect(weapon.title).to eq('Sword #5')
    end
  end

end
