class Usuario < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  belongs_to :departamento

  # Las validaciones del password e email las hace el modulo de
  # validatable por defecto.
  validates :nombre, presence: true
  validates :telefono, presence: true
end
