class Departamento < ActiveRecord::Base
  before_save {self.codigo = codigo.upcase}
  
  validates :nombre, presence: true, uniqueness: { case_sensitive: false } 
  
  #regex sacada del tutorial de rails. Posiblemente se cambie.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :correo, presence: true,format: { with: VALID_EMAIL_REGEX }
  
  validates :pcontacto, presence: true

  validates :codigo, presence: true, format: {with: /\A[a-zA-Z]{2}\z/}

end
