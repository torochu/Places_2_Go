Rails.application.routes.draw do
  mount TaiwanCity::Engine => '/taiwan_city'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  namespace :adm do
    resources :places
  end
  
  root 'pages#welcome'
  resources :places

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
