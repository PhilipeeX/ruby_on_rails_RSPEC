class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to weapons_index_path
  end

  def delete
  end

  def show
  end

  private
  def weapon_params
    params.require(:weapon).permit(:weaponname, :description, :power_base, :power_step, :level)
  end
end
