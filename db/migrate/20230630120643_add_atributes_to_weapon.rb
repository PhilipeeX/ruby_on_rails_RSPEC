class AddAtributesToWeapon < ActiveRecord::Migration[7.0]
  def change
    add_column :weapons, :weaponname, :string
    add_column :weapons, :description, :string
    add_column :weapons, :power_base, :integer
    add_column :weapons, :power_step, :integer
    add_column :weapons, :level, :integer
  end
end
