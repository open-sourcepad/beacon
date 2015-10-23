class Api::V1::AidsController < Api::ApiController

  def index
    @objs = Aid.all
  end

  def create
    @obj = Aid.new(obj_params)

    unless @obj.save
      render json: { errors: @obj }, status: 422
    end
  end

  def show
    @objs = Aid.where(recipient_id: params[:id]).active
  end


  private

  def obj_params
    params.require(:aid).permit(*%i(
      recipient_id
      criminal_id
    ))
  end
end
