Rails.application.routes.draw do
  get 'map/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'map#index'
end
