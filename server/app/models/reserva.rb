class Trimestre < ActiveModel::Validator
  def validate(record)
  	begin
  	  record.semanas_activas.each do |s|
  	  	unless 0 <= s and s <= 12
  	  	  record.errors[:semanas_activas] <<
  	  	  "debe contener sólo números entre 0 y 12"
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
  has_many :horarios
  validates :sala_nombre, presence: true
  validates :materia_id, presence: true
  validates :horarios, presence: true
  validates :semanas_activas, presence: true
  serialize :semanas_activas, Array
  validates_with Trimestre
end
