Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace "api" do
    namespace "v1" do
      get 'home', to: 'articles#index'
      resources :articles, :controller => "articles/articles"  do
        resources :comments, only: [:index,  :create, :update, :destroy]
        post "favorites", on: :member, to: "articles/favorites#create"
        delete "favorites", on: :member, to: "articles/favorites#destroy"
      end
      resources :users do
        resources :articles, only: [:index], controller: "articles/user_articles"
        post "follows", on: :member, to: "follows#create"
        delete "follows", on: :member, to: "follows#destroy"
        collection do
          post "login" => "sessions#create"
          post "signup" => "users#create"
        end
      end
      get "popular_tags", to: "tags#index"
      get "popular_articles", to: "articles/favorites#index"
      resources :categories, only: [:index] do
        get "articles", on: :member, to: "categories#show"
      end
      resources :searches, only: [:index]
    end
  end
end
