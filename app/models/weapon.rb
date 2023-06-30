class Weapon < ApplicationRecord
  validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 99 }

  def current_power
    power_base + ((level - 1) * power_step)
  end

  def title
    "#{weaponname} ##{level}"
  end
end
