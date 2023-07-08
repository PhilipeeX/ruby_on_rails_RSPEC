class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)

    if @weapon.save
      flash[:notice] = 'Nova arma salva com sucesso'
      redirect_to weapons_index_path
    else
      flash[:notice] = 'Houve um erro ao salvar a arma'
      redirect_to weapons_create_path
    end

  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy
    head :no_content
  end

  def show
    @weapon = Weapon.find(params[:id])
    redirect_to weapons_show_path(@weapon)
  end

  private
  def weapon_params
    params.require(:weapon).permit(:weaponname, :description, :power_base, :power_step, :level)
  end
end
