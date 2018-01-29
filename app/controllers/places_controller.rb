# frozen_string_literal: true

# Notes controller. Notes inherits ProtectedController

class PlacesController < ProtectedController
  before_action :set_place, only: %i[show update destroy]

  # GET /places
  def index
    @places = current_user.places.all

    render json: @places
  end

  # GET /places/1
  def show
    render json: @place
  end

  # POST /places
  def create
    @place = current_user.places.build(place_params)

    if @place.save
      render json: @place, status: :created
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = current_user.places.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
