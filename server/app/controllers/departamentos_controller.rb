class DepartamentosController < ApplicationController
  
  def index
    @dep_list = Departamento.all 
    render json: @dep_list
  end
  
  def show
    @dep = Departamento.find(params[:id])
    render json: @dep
  end
  
  # def create
  #   @dep = Departamento.new(dep_params)
  #   if @dep.save
  #     render nothing: true, status: 201
  #   else
  #     render nothing: true, status: 400
  #   end
  # end
  
  def update
    @dep = Departamento.find(params[:id])
    if @dep.update_attributes(dep_params)
       render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end
  
  # def destroy
  # end
  
  private

    def dep_params
      params.require(:departamento).permit(:nombre, :correo, :pcontacto)
    end
  
end
