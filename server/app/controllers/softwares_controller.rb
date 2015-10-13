class SoftwaresController < ApplicationController

  # Cuando se modifique la sala para ser una referencia
  # probablemente se debera modificar.
  # Lista del software de una sala
  def index
    @sw_list = Software.where(sala_nombre: params[:sala_nombre])

    render json: @sw_list
  end

  # Detalles de un software
  def show
    @sw = Software.find_by(id: params[:id])

    if @sw && @sw.sala_nombre == params[:sala_nombre]
      render json: @sw
    else
      render nothing: true, status: :not_found
    end
  end

  # Crear software
  def create
    @sw = Software.new(params.require(:software).permit(:nombre, :version, :link))
    @sw.sala = params[:sala_nombre]
    if @sw.save
      render nothing: true, status: :created
    else
      render nothing: true, status: :bad_request
    end
  end

  # Borrar un software
  def destroy
    @sw = Software.find(params[:id])

    if @sw
      @sw.destroy
    end
    render nothing: true, status: :ok
  end

  # Borrar todo el software de una sala
  def destroyAll
    Software.destroy_all(sala_nombre: params[:sala_nombre])

    render nothing: true, status: :ok
  end

  # Modifica los atributos de un software
  def update
    @sw = Software.find(params[:id])

    if @sw
      render nothing: true, status: :not_found
    elsif @sw.update_attributes(params.require(:software).permit(:nombre, :version, :link))
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end
end
