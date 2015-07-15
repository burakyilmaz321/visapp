Rails.application.routes.draw do
  root 'static_pages#home'
  get  'signup' => 'user_firm#new'
end
