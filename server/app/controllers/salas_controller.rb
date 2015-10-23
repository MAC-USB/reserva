class SalasController < ApplicationController
  def index
    @salas_list = Sala.all
    render json: @salas_list
  end

  def show
    @sala = Sala.find(params[:id])
    render json: @sala
  end

  def update
    @sala = Sala.find(params[:id])
    if @sala.update_attributes(params.require(:sala).permit(
      :name, :capacidad, :ubicacion, :responsable,
      :windows, :linux, :video_beam))
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

end
