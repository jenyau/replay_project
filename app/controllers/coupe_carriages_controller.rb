class CoupeCarriagesController < ApplicationController
  before_action :set_coupe_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @coupe_carriages = CoupeCarriage.all
  end

  def show
  end

  def new
    @coupe_carriage = CoupeCarriage.new
  end

  def create
    @coupe_carriage = CoupeCarriage.new(coupe_carriage_params)

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
    redirect_to coupe_carriages_path
  end

  private
  def set_coupe_carriage
    @coupe_carriage = CoupeCarriage.find(params[:id])
  end

  def coupe_carriage_params
    params.require(:coupe_carriage).permit(:number, :train_id, :top_seats, :bottom_seats)
  end
end