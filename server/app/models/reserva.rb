class Reserva < ActiveRecord::Base
  belongs_to :materia
  belongs_to :sala, primary_key: "nombre", foreign_key: "sala_nombre"
end
