Rails.application.routes.draw do
  get 'payment_methods/index'
  get 'payment_methods/show'
  get 'payment_methods/create'
  get 'payment_methods/update'
  get 'payment_methods/destroy'
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/update'
  get 'categories/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
