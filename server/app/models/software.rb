class Software < ActiveRecord::Base
  belongs_to :sala
  validates :sala_id, presence: true
  validates :nombre, presence: true, uniqueness: {scope: [:sala, :version]}
end
