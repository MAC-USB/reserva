Rails.application.routes.draw do
  resources :salas do
    resources :softwares, only: [:index, :show]
  end
end
