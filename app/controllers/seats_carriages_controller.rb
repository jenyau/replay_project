class SeatsCarriagesController < ApplicationController
  before_action :set_seats_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @seats_carriages = SeatsCarriage.all
  end

  def show
  end

  def new
    @seats_carriage = SeatsCarriage.new
  end

  def create
    @seats_carriage = SeatsCarriage.new(seats_carriage_params)

    if @seats_carriage.save
      redirect_to @seats_carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seats_carriage.update(seats_carriage_params)
      redirect_to @seats_carriage
    else
      render :edit
    end
  end

  def destroy
    @seats_carriage.destroy
    redirect_to seats_carriages_path
  end

  private
  def set_seats_carriage
    @seats_carriage = SeatsCarriage.find(params[:id])
  end

  def seats_carriage_params
    params.require(:seats_carriage).permit(:number, :train_id, :seat_places)
  end
end