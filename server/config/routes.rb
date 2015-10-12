Rails.application.routes.draw do

  resources :departamentos

  resources :salas do |ruta_sala|
    delete "#{ruta_sala}/softwares" => 'softwares#destroyAll'
    resources :softwares, only: [:index, :show,  :update]
  end
end
