class Materia < ActiveRecord::Base
	before_save {self.codigo = codigo.upcase}
	validates :nombre, presence: true
	validates :codigo, format: {with: /\A[a-zA-Z]{2}\d{4}\z/},
	 				   uniqueness: {case_sensitive: false}
	validates :departamento, presence: true
end
