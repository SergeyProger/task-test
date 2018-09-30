Rails.application.routes.draw do
  root 'cost#index'
  get 'cost/index' => 'cost#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
