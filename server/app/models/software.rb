class Software < ActiveRecord::Base
  validates :nombre, presence: true
end
