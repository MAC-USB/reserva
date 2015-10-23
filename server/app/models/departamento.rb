class Departamento < ActiveRecord::Base
  before_save {self.codigo = codigo.upcase}

  validates :nombre, presence: true, uniqueness: { case_sensitive: false }

  # Se elimino el correo de departamento, un departamento no tiene correo

  validates :pcontacto, presence: true

  validates :codigo, presence: true, format: {with: /\A[a-zA-Z]{2}\z/}

end
