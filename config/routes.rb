Rails.application.routes.draw do
  #get 'tool_categories/new'
  #get 'tool_categories/index'
  #get 'categories/new'
  #get 'categories/index'
  # get 'user_tools/new'
  #get 'user_tools', to: "user_tools#index"
  # get 'tools/new'
  #get 'tools/create'
  # get 'users/new', to: 'users#new'
  root "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get "/articles", to: "articles#index"
  #get "/tools", to: "tools#index"
  # get "/users", to: "users#index"
  # post "/tools/:id", to: "tools#create"
  #get "/articles/:id", to: "articles#show"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
  resources :users
  resources :tools
  resources :user_tools
  resources :categories
  resources :tool_categories
end
