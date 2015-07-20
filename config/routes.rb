Rails.application.routes.draw do
  root 'static_pages#home'
  get  'signup' => 'user_firm#new'
  resources :user_firms
  resources :user_firms do
    resources :users
  end
end
