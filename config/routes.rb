Rails.application.routes.draw do
  resources :units
  resources :products

  namespace :products do
    get ':id/units', to: 'units#show'
  end

  namespace :units do
    get ':id/product', to: 'product#show'
  end
end
