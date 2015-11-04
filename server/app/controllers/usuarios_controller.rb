class UsuariosController < ApplicationController
  
  def index
    @list = Usuarios.all
    render json: @list
  end

  def show
    @usr = Usuarios.find(params[:id])
    if @usr 
      render json:@list 
    else
      render nothing: true, status: :not_found
    end
  end

end

