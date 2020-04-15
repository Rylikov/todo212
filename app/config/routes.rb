Rails.application.routes.draw do
  root 'site#index'
  get 'login' => 'sessions#show_login_page'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  get 'signup' => 'users/signup'
  get 'site/index'
  resources :tasks

end
