class ReservaController < ApplicationController

  def show
  end

  def index
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
