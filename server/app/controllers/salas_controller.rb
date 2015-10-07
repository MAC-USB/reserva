class SalasController < ApplicationController
  def index
    @salas_list = Sala.all
    render json: @salas_list
  end

  def show
    @sala = Sala.find(params[:id])
    render json: @sala
  end

end
