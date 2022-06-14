Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "url#index"
  post "/", to: "url#create"
  post "delete_url", to: "url#delete"
  get '/:id' => "shortener/shortened_urls#show"
  resources :url
  # Defines the root path route ("/")
  # root "articles#index"
end
