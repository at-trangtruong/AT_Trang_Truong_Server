Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace "api" do
    get 'home', to: 'articles#index'
    resources :users do
      collection do
        post "login" => "sessions#create"
        post "signup" => "users#create"
      end
    end
  end
end
