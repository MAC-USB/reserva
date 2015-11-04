class Anuncio < ActiveRecord::Base
  belongs_to :usuario
  validate :contenido, presence: true,
            length: {in: 1..140}
  validate :usuario, presence: true
end
