Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  root to: "recipes#index"

  resources :recipes do
    collection do
      get 'search'
    end
  end
  resources :users
end