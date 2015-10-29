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
    @reserva = Reserva.find_by(id: params[:id])
    if not @reserva
      render nothing: true, status: :not_found
    elsif @reserva.update_attributes(params.require(:reserva).permit(:sala_nombre, :materia))
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end

  def destroy
     @reserva = Reserva.find_by(id: params[:id])
    if @reserva
      @reserva.destroy
    end
    render nothing: true, status: :ok
  end
  
  def destroyAll
    Reserva.destroy_all(sala_nombre: params[:sala_nombre])
    render nothing: true, status: :ok
  end
end
