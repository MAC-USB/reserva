class Software < ActiveRecord::Base
  validates :nombre, presence: true
  #validates :sala, uniqueness: {scope: [:nombre, :version]}
end
