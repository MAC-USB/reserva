Rails.application.routes.draw do

  resources :departamentos, param: :nombre

  resources :salas do |ruta_sala|
    delete "#{ruta_sala}/softwares" => 'softwares#destroyAll'
    resources :softwares, only: [:index, :show,  :update]
  end

  resources :materias, param: :codigo, only: [:index, :create, :show, :update, :destroy]
  
end
