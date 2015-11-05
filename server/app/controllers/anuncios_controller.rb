class AnunciosController < ApplicationController
  def index
    @list = Anuncio.all
    render json: @list
  end

  def show
    @anuncio = Anuncio.find_by(id: params[:id])
    if @anuncio
      render json: @anuncio
    else
      render nothing: true, status: :not_found
    end
  end

  def create
    @anuncio = Anuncio.new(params.require(:anuncio).permit(:contenido))
    ## El usuario del anuncio sera el usuario autenticado
    @anuncio.usuario_id = current_user.id
    if @anuncio.save
      render json: @anuncio.save, status: :created
    else
      render nothing: true, status: :conflict
    end
  end

  def update
    @anuncio = Anuncio.find_by(id: params[:id])
    if @anuncio.nil?
      render nothing: true, status: :not_found
    elsif @anuncio.update_attributes(params.require(anuncio).permit(:contenido))
      render nothing: true, status: :ok
    else
      render nothing: true, status: :conflict
    end
  end

  def destroy
    @anuncio = Anuncio.find_by(id: params[:id])
    if @anuncio
      @anuncio.destroy!
    end
    render nothing: true, status: :ok
  end

end
