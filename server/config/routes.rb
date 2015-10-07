Rails.application.routes.draw do
  resources :salas do |ruta_sala|
    delete "#{ruta_sala}/softwares" => 'softwares#destroyAll'
    resources :softwares, only: [:index, :show, :create, :destroy, :update]
  end
end
