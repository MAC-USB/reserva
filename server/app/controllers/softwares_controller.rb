class SoftwaresController < ApplicationController
   
   # Cuando se modifique la sala para ser una referencia
   # probablemente se debera modificar.
   # Lista del software de una sala
   def index
      @sw_list = Software.where(sala: params[:sala_id])

      render json: @sw_list
   end

   # Detalles del software
   def show
      @sw = Software.find(params[:id])

      render json: @sw
   end
end
