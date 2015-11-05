class Usuario < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  belongs_to :departamento

  VALID_CARNET = /\A\d{2}-\d{5}\z/

  before_validation { self.telefono = telefono.delete("-") }

  # Las validaciones del password e email las hace el modulo de
  # validatable por defecto.
  validates :nombre, presence: true
  validates :telefono, presence: true, numericality: true
  validates :carnet, uniqueness: true,
    format: {with: VALID_CARNET}, unless: "carnet.nil?"

end
