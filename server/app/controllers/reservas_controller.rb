class ReservasController < ApplicationController

  def create
    r_params = params.require(:reserva)
      .permit(:sala_nombre, :materia_id, :video_beam,
      :requerimientos, :semanas_activas => [], :horarios => [[]])
    r_params[:sala_nombre] = params[:sala_nombre]
    horarios_created = []
    if params[:reserva][:horarios]
      params[:reserva][:horarios].each do |h|
        horarios_created << Horario.create!(dia: h.first,
          hora_inicio: Tod::TimeOfDay(h.second),
          hora_fin: Tod::TimeOfDay(h.third))
      end
      r_params[:horarios] = horarios_created
    end
    @reserva = Reserva.new(r_params)
    if @reserva.save!
      render nothing: true, status: :created
    else
      render nothing: true, status: :conflict
    end
  end

  def show
    @reserva = Reserva.find(params[:id])
    if @reserva
      render :json => @reserva
    else
      render nothing: true, status: :not_found
    end
  end

  def index
    @list = Reserva.all
    render json: @list
  end

  def update
    @reserva = Reserva.find_by(id: params[:id])
    if not @reserva
      render nothing: true, status: :not_found
    else
      r_params = params.require(:reserva)
      .permit(:sala_nombre, :materia_id, :semanas_activas => [],
        :horarios => [[]])
      if params[:reserva][:horarios]
        @reserva.horarios.each do |h|
          h.destroy
        end
        horarios_created = []
        params[:reserva][:horarios].each do |h|
          horarios_created << Horario.create!(dia: h.first,
            hora_inicio: Tod::TimeOfDay(h.second),
            hora_fin: Tod::TimeOfDay(h.third))
        end
        r_params[:horarios] = horarios_created
      end
      if @reserva.update!(r_params)
        render nothing: true, status: :ok
      else
        render nothing: true, status: :bad_request
      end
    end
  end

  def destroy
     @reserva = Reserva.find_by(id: params[:id])
    if @reserva
      @reserva.horarios.each do |h|
        h.destroy!
      end
      @reserva.destroy!
    end
    render nothing: true, status: :ok
  end

  def destroyAll
    Reserva.where(sala_nombre: params[:sala_nombre]).each do |r|
      r.horarios.each do |h|
        h.destroy!
      end
      r.destroy!
    end
    render nothing: true, status: :ok
  end
end
