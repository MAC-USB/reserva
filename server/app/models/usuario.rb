class Usuario < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable#, :validatable,
          #:confirmable
  include DeviseTokenAuth::Concerns::User

  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :telefono, presence: true
end
