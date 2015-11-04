class Usuarios::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nombre, :telefono, :carnet,
      :titulo, :oficina, :carrera, :departamento)

    devise_parameter_sanitizer.for(:account_update).push(:nombre, :telefono,
      :carnet, :titulo, :oficina, :carrera, :departamento)
  end
end