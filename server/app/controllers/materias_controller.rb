class MateriasController < ApplicationController
	def index
		@list = Materia.all
		render json: @list
	end

	def show
		@materia = Materia.find_by(id: params[:id])
		if @materia
			render json: @materia
		else
			render nothing: true, status: :not_found
		end
	end

	def create
		@materia = Materia.new(params.require(:materia).permit(:nombre, :codigo, :departamento))
		if @materia.save
			render nothing: true, status: :created
		else
			render nothing: true, status: :conflict
		end
	end

	def update
		@materia = Materia.find_by(id: params[:id])
		if @materia.nil?
			render nothing: true, status: :not_found
		elsif @materia.update_attributes(params.require(:materia).permit(:nombre, :departamento))
			render nothing: true, status: :ok
		else
			render nothing: true, status: :conflict
		end
	end

	def destroy
		@materia = Materia.find_by(id: params[:id])
		if @materia
			@materia.destroy
		end

		render nothing: true, status: :ok
	end

end
