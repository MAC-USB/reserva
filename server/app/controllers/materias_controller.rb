class MateriasController < ApplicationController
	def index
		@list = Materia.all
		render json: @list
	end

	def show
		@materia = Materia.find(params[:codigo])
		render json: @materia
	end

	def create
		@materia = Materia.new(params.require(:codigo, :nombre, :departamento))
		if @materia.save
			render nothing: true, status: 201
		else
			render nothing: true, status: 400
		end
	end

	def update
		@materia = Materia.find(params[:codigo])
		if @materia.update_attributes(params.permit(:nombre, :departamento))
			render nothing: true, status: 200
		else
			render nothing: true, status: 400
		end
	end

	def destroy
		Materia.find(params[:codigo]).destroy

		render nothing: true, status: 200
	end

end
