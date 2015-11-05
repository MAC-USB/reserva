class Anuncio < ActiveRecord::Base
  belongs_to :usuario
  validates :contenido, presence: true,
            length: {in: 1..140}
  validates :usuario, presence: true
end
