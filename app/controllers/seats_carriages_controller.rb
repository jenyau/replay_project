class SeatsCarriagesController < ApplicationController
  before_action :set_seats_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:index, :new, :create]

  def index
    @seats_carriages = @train.carriages.seats.all
  end

  def show
  end

  def new
    @seats_carriage = @train.carriages.seats.new
  end

  def create
    @seats_carriage = @train.carriages.seats.new(seats_carriage_params)

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
    redirect_to trains_path
  end

  private
  def set_seats_carriage
    @seats_carriage = SeatsCarriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def seats_carriage_params
    params.require(:seats_carriage).permit(:number, :train_id, :seat_places)
  end
end