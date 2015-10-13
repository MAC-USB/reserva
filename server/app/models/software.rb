class Software < ActiveRecord::Base
  belongs_to :sala, primary_key: "nombre", foreign_key: "sala_nombre"
  validates :sala_nombre, presence: true
  validates :nombre, presence: true, uniqueness: {scope: [:sala_nombre, :version]}
end
