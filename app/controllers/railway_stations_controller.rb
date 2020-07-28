class RailwayStationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time_position]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  # POST /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully created.' }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railway_stations/1
  # PATCH/PUT /railway_stations/1.json
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully updated.' }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
    end
  end

  # def update_position
  #   @route = Route.find(params[:route_id])
  #   StationService.call(@railway_station, @route, params[:position])
  # end

  def update_position
    @route = Route.find(params[:route_id])

    @railway_station.update_position(@route, params[:station_position])
    redirect_to route_path(@route)
  end

  def update_time_position
    @route = Route.find(params[:route_id])

    @railway_station.update_time_position(@route, params[:arrival_time], params[:departure_time])
    redirect_to route_path(@route)
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
