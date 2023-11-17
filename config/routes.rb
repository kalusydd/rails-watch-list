Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "lists#index"

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end

# get "lists", to: "lists#index"  Page with all the content
# get "/lists/:id", to: "lists#show" Pahe with one specific content piece
# get "/lists/new", to: "lists#new"
# post "lists", to: "lists#create"

#  do
#   collection do
#     get :index
#     get :new
#     post :create
#   end

#   member do
#     get :top, :show
#   end
# end
