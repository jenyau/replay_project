class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time_position]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station]
    else
      render :new
   end
  end

  def update
      if @railway_station.update(railway_station_params)
        redirect_to [:admin, @railway_station]
      else
        render :edit
      end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path
  end

  def update_position
    @route = Route.find(params[:route_id])

    @railway_station.update_position(@route, params[:station_position])
    redirect_to [:admin, @route]
  end

  def update_time_position
    @route = Route.find(params[:route_id])

    @railway_station.update_time_position(@route, params[:arrival_time], params[:departure_time])
    redirect_to [:admin, @route]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def railway_station_params
      params.require(:railway_station).permit(:title, :route_id, :station_position, :arrival_time, :departure_time)
    end
end
