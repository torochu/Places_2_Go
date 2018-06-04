Rails.application.routes.draw do
  mount TaiwanCity::Engine => '/taiwan_city'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  namespace :adm do
    resources :places
    resources :users
    resources :likes
  end
  
  root 'pages#welcome'

  resources :places do
    # only for current user (singular like)
    resource :like, module: :places
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
