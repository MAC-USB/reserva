class Horario < ActiveRecord::Base
  belongs_to :reserva
  validates :dia, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fin, presence: true
  serialize :hora_inicio, Tod::TimeOfDay
  serialize :hora_fin, Tod::TimeOfDay
end
