class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end
  def new
    @elNuevo=Monster.new
  end

  def create
    @elNuevo=Monster.new(parametrosStrongMonster)
    if (@elNuevo.save)
      redirect_to edit_monster_path(@elNuevo.id)
    else
      render :new, status: :see_other
    end
  end
  def parametrosStrongMonster
    params.require(:monster).permit( :name, :description, :phone, :birthdate, image: [])
  end

  def edit
    @monsterD=Monster.find(params[:id])
  end

  def update
    @monsterD=Monster.find(params[:id])

    if (@monsterD.update(parametrosStrongMonster))
      puts "editado"
      redirect_to monster_path, notice: "Monster editado"
    else
      puts "no se puedo editar"
      render :edit
    end
  end
end
