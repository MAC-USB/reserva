class DepartamentosController < ApplicationController
  
  def index
    @dep_list = Departamento.all 
    render json: @dep_list
  end
  
  def show
    @dep = Departamento.find_by(nombre: params[:nombre])
    render json: @dep
  end
  

  def update
    puts params
    @dep = Departamento.find_by(nombre: params[:nombre])
    if @dep.update_attributes(dep_params)
       render nothing: true, status: 200
    else 
      render nothing: true, status: 400
    end
  end
  
  
  private

    def dep_params
      params.require(:departamento).permit(:nombre, :correo, :pcontacto)
    end
  
end
