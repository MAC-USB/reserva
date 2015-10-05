Rails.application.routes.draw do
  resources :salas do |cosa|
    delete "#{cosa}/softwares" => 'softwares#destroyAll'
    resources :softwares, only: [:index, :show, :create, :destroy]
  end
end
