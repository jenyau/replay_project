class CoupeCarriagesController < ApplicationController
  before_action :set_coupe_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:index, :new, :create]

  def index
    @coupe_carriages = @train.carriages.coupe.all
  end

  def show
  end

  def new
    @coupe_carriage = @train.carriages.coupe.new
  end

  def create
    @coupe_carriage = @train.carriages.coupe.new(coupe_carriage_params)

    if @coupe_carriage.save
      redirect_to @coupe_carriage
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coupe_carriage.update(coupe_carriage_params)
      redirect_to @coupe_carriage
    else
      render :edit
    end
  end

  def destroy
    @coupe_carriage.destroy
    redirect_to trains_path
  end

  private
  def set_coupe_carriage
    @coupe_carriage = CoupeCarriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def coupe_carriage_params
    params.require(:coupe_carriage).permit(:number, :train_id, :top_seats, :bottom_seats)
  end
end