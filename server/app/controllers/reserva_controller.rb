class ReservaController < ApplicationController

  def create
    @reserva = Reserva.new(params.require(:reserva)
      .permit(:sala_nombre, :materia, :video_beam, :requerimientos))
    if @reserva.save!
      render nothing: true, status: :created
    else
      render nothing: true, status: :conflict
    end
  end

  def show
    @reserva = Reserva.find(params[:id])
    if @reserva
      render json: @reserva
    else
      render nothing: true, status: :not_found
    end
  end

  def index
    @list = Reserva.all
    render json: @list
  end

  def update
  end

  def destroy
  end
end
