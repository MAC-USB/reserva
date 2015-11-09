class Departamento < ActiveRecord::Base
  before_save {self.codigo = codigo.upcase}


  validates :nombre, presence: true, uniqueness: { case_sensitive: false }
  validates :codigo, presence: true, format: {with: /\A[a-zA-Z]{2}\z/}


end
