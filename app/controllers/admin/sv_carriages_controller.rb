class Admin::SvCarriagesController < Admin::BaseController
  before_action :set_sv_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:index, :new, :create]

  def index
    @sv_carriages = @train.carriages.sv.all
  end

  def show
  end

  def new
    @sv_carriage = @train.carriages.sv.new
  end

  def create
    @sv_carriage = @train.carriages.sv.new(sv_carriage_params)

    if @sv_carriage.save
      redirect_to [:admin, @sv_carriage]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sv_carriage.update(sv_carriage_params)
      redirect_to [:admin, @sv_carriage]
    else
      render :edit
    end
  end

  def destroy
    @sv_carriage.destroy
    redirect_to admin_trains_path
  end

  private
  def set_sv_carriage
    @sv_carriage = SvCarriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def sv_carriage_params
    params.require(:sv_carriage).permit(:number, :train_id, :bottom_seats)
  end
end