Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  # make comments a nested resource under articles
  resources :articles do
    resources :comments
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
