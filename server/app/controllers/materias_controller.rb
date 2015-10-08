class MateriasController < ApplicationController
	def index
		@list = Materia.all
		render json: @list
	end

	def show
		@materia = Materia.find_by(codigo: params[:codigo])
		if @materia
			render json: @materia
		else
			render nothing: true, status: 404
		end
	end

	def create
		@materia = Materia.new(codigo: params.require(:codigo),nombre: params.require(:nombre),
													 departamento: params.require(:departamento))
		if @materia.save
			render nothing: true, status: 201
		else
			render nothing: true, status: 400
		end
	end

	def update
		@materia = Materia.find_by(codigo: params[:codigo])
		if @materia.nil?
			render nothing: true, status: 404
		
		elsif @materia.update_attributes(params.permit(:nombre, :departamento))
			render nothing: true, status: 200
		else
			render nothing: true, status: 400
		end
	end

	def destroy
		Materia.find_by(codigo: params[:codigo]).destroy

		render nothing: true, status: 200
	end

end
