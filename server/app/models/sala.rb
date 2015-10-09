class Sala < ActiveRecord::Base
  has_many :softwares
  validates :nombre, presence: true, uniqueness: {case_sensitive: false}
  validates :windows, :default => false
  validates :linux, :default => false
  validates :video_beam, :default => false
end
