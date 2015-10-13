class Sala < ActiveRecord::Base
  has_many :softwares, primary_key: "nombre", foreign_key: "sala_nombre"
  validates :nombre, presence: true, uniqueness: {case_sensitive: false}
  validates :windows, :default => false
  validates :linux, :default => false
  validates :video_beam, :default => false
end
