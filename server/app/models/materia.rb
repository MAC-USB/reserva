class Materia < ActiveRecord::Base
  has_many :resevas
  belongs_to :departamento
  before_save {self.codigo = codigo.upcase}
  validates :nombre, presence: true,
  			uniqueness: {case_sensitive: false}
  validates :codigo, format: {with: /\A[a-zA-Z]{2}\d{4}\z/},
             uniqueness: {case_sensitive: false}
end
