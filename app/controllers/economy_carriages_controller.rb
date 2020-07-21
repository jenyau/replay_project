class EconomyCarriagesController < ApplicationController
  before_action :set_economy_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @economy_carriages = EconomyCarriage.all
  end

  def show
  end

  def new
    @economy_carriage = EconomyCarriage.new
  end

  def create
    @economy_carriage = EconomyCarriage.new(economy_carriage_params)

    if @economy_carriage.save
      redirect_to @economy_carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @economy_carriage.update(economy_carriage_params)
      redirect_to @economy_carriage
    else
      render :edit
    end
  end

  def destroy
    @economy_carriage.destroy
    redirect_to economy_carriages_path
  end

  private
  def set_economy_carriage
    @economy_carriage = EconomyCarriage.find(params[:id])
  end

  def economy_carriage_params
    params.require(:economy_carriage).permit(:number, :train_id, :top_seats, :bottom_seats,
                                             :side_top_seats, :side_bottom_seats)
  end
end