class Departamento < ActiveRecord::Base
  
  validates :nombre, presence: true, uniqueness: { case_sensitive: false } 
  
  #regex sacada del tutorial de rails. Posiblemente se cambie.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :correo, presence: true,format: { with: VALID_EMAIL_REGEX }
  
  validates :pcontacto, presence: true
end
