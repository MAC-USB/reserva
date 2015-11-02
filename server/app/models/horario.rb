class HoraFactible < ActiveModel::Validator
  def validate(record)
  	unless record.hora_fin > record.hora_inicio
  	  record.errors[:hora_fin] << "debe ser posterior a hora inicio."
  	end
  end
end

class HorasEnBloques < ActiveModel::Validator
  def es_bloque?(hora)
  	hora.strftime("%M") == "30" and hora >= Tod::TimeOfDay("7:30") and
  	hora <= Tod::TimeOfDay("19:30")
  end

  def validate(record)
  	unless es_bloque? record.hora_inicio and es_bloque? record.hora_fin and
  		(Tod::Shift.new(record.hora_inicio, record.hora_fin).duration % 3600) == 0
  	  record.errors[:hora_inicio] << " + Hora Fin debe ser un bloque"+
  	  " aceptado por la USB."
  	end
  end
end

class Horario < ActiveRecord::Base
  belongs_to :reserva
  validates :dia, presence: true
  validates :dia, numericality: { :greather_than_or_equal_to => 1 }
  validates :dia, numericality: { :less_than_or_equal_to => 5 }
  validates :hora_inicio, presence: true
  validates :hora_fin, presence: true
  serialize :hora_inicio, Tod::TimeOfDay
  serialize :hora_fin, Tod::TimeOfDay
  validates_with HoraFactible

  #Comentar la sigueinte linea para permitir reservas fuera de bloques
  validates_with HorasEnBloques
end
