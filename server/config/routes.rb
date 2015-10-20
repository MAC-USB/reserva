Rails.application.routes.draw do

  resources :salas, param: :nombre do |ruta_sala|
  	delete "#{ruta_sala}/softwares" => 'softwares#destroyAll'
  	resources :softwares, only: [:index, :show, :create, :destroy, :update]
  end

  resources :materias, only: [:index, :create, :show, :update, :destroy]

  resources :departamentos, param: :nombre
  
end
