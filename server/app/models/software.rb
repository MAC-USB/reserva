class Software < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: {scope [:nombre, :version]}
end
