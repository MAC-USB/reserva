class Trimestre < ActiveModel::Validator
  def validate(record)
  	begin
  	  record.semanas_activas.each do |s|
  	  	unless 0 < s and s <= 12
  	  	  record.errors[:semanas_activas] <<
  	  	  "debe contener sólo números entre 1 y 12"
  	  	end
  	  end
  	rescue ArgumentError
  	 	record.errors[:semanas_activas] <<
  	 	"debe contener enteros únicamente."
  	end
  end
end

class Reserva < ActiveRecord::Base
  belongs_to :materia
  belongs_to :sala, primary_key: "nombre", foreign_key: "sala_nombre"
  belongs_to :reservador, class_name: "Usuario"
  belongs_to :encargado, class_name: "Usuario"
  belongs_to :responsable, class_name: "Usuario"
  has_many :horarios
  validates :reservador_id, presence: true
  validates :sala_nombre, presence: true
  validates :materia_id, presence: true
  validates :horarios, presence: true
  validates :semanas_activas, presence: true
  serialize :semanas_activas, Array
  validates_with Trimestre

  def as_json(options)
    result = {}
    horarios_json = []
    horarios.each do |h|
      horarios_json << [h.dia, h.hora_inicio.strftime("%H:%M"),
        h.hora_fin.strftime("%H:%M")]
    end
    result = { :id => id,
      :sala_nombre => sala_nombre,
      :materia_id => materia_id,
      :semanas_activas => semanas_activas,
      :requerimientos => requerimientos,
      :created_at => created_at,
      :updated_at => updated_at,
      :video_beam => video_beam,
      :horarios => horarios_json
    }
  end
end
