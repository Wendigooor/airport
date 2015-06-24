class PlanesController < ApplicationController
  respond_to :html, :json
  before_filter :set_plane, only: [:show, :edit, :update, :destroy]

  def index
    @planes = Plane.all
  end

  def show
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.create(plane_params)
    respond_with @plane
  end

  def edit
  end

  def update
    @plane.update_attributes(plane_params)
    respond_with @plane
  end

  def destroy
    @plane.destroy
    respond_with @plane
  end

  def control_center
    @planes = Plane.available
  end

  def start
    if params[:ids]
      params[:ids].each do |plane_id|
        plane = Plane.find(plane_id)
        plane.update_attributes(status: "in_queue")
      end
    end
    render json: {status: :ok}
  end

  private
    def set_plane
      @plane = Plane.find(params[:id])
    end

    def plane_params
      params.require(:plane).permit(:name, :status, :time_for_takeoff)
    end
end
