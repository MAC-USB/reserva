Rails.application.routes.draw do
  mount_devise_token_auth_for 'Usuario', at: 'auth'

  resources :salas, param: :nombre do |ruta_sala|
  	delete "#{ruta_sala}/softwares" => 'softwares#destroyAll'
  	resources :softwares, only: [:index, :show, :create, :destroy, :update]
  end

  resources :materias, only: [:index, :create, :show, :update, :destroy]

  resources :departamentos, param: :nombre
  
end
