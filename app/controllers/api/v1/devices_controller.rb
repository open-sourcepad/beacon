class Api::V1::DevicesController < Api::ApiController

  def index
    @objs = Device.all
  end

  def create
    @obj = Device.new(obj_params)

    unless @obj.save
      render json: { errors: @obj }, status: 422
    end
  end


  private

  def obj_params
    params.require(:device).permit(*%i(
      device_id
      latitude
      longitude
      state
    ))
  end
end
