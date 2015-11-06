class Sala < ActiveRecord::Base
  has_many :softwares, primary_key: "nombre", foreign_key: "sala_nombre"
  has_many :reservas, primary_key: "nombre", foreign_key: "sala_nombre"
  belongs_to :usuario, primary_key: "id", foreign_key: "responsable"
  validates :nombre, presence: true, uniqueness: {case_sensitive: false}
  validates :windows, :default => false
  validates :linux, :default => false
  validates :video_beam, :default => false
end
