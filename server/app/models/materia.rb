class Materia < ActiveRecord::Base
  has_many :resevas
	before_save {self.codigo = codigo.upcase}
	validates :nombre, presence: true
	validates :codigo, presence: true,
	 				   format: {with: /\A[a-zA-Z]{2}\d{4}\z/},
	 				   uniqueness: {case_sensitive: false}
	validates :departamento, presence: true
end
