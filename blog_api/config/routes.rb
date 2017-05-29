Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace "api" do
    namespace "v1" do
      get 'home', to: 'articles#index'
      resources :articles, :controller => "articles/articles"  do
        resources :comments, only: [:index,  :create, :update, :destroy]
        resources :favorites, only: [:create, :destroy], :controller => "articles/favorites"
      end
      resources :users do
        resources :follows, only: [:create, :destroy]
        collection do
          post "login" => "sessions#create"
          post "signup" => "users#create"
        end
      end
      resources :tags
      resources :categories, only: [:index]
    end
  end
end
