class Materia < ActiveRecord::Base
	before_save {self.codigo = codigo.downcase}
	validates :nombre, presence: true
	validates :codigo, presence: true,
	 				   format: {with: /\A[a-zA-Z]{2}\d{4}\z/},
	 				   uniqueness: true
	# validates :departamento, presence: true
end
