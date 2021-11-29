Rails.application.routes.draw do
  resources :user, path: "/", only: [] do
    resource :money_info
    resources :fixed_costs, :categories, :payment_methods, :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
