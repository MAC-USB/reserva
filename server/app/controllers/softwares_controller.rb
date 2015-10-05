class SoftwaresController < ApplicationController
   
   # Cuando se modifique la sala para ser una referencia
   # probablemente se debera modificar.
   # Lista del software de una sala
   def index
      @sw_list = Software.where(sala: params[:sala_id])

      render json: @sw_list
   end

   # Detalles de un software
   def show
      @sw = Software.find(params[:id])

      render json: @sw
   end

   # Crear software
   def create
      @sw = Software.new(params.require(:software).permit(:nombre, :version, :link))
      @sw.sala = params[:sala_id]
      if @sw.save
         render json: @sw
      else
         render json: nil
      end
   end

   # Destruir un software
   def destroy
      Software.find(params[:id]).destroy

      render nothing: true, status: 200
   end

   # Destruir todo el software de una sala
   def destroyAll
      Software.destroy_all(sala: params[:sala_id])

      render nothing: true, status: 200
   end
end
