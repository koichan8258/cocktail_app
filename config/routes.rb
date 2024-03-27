Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  root to: "recipes#index"

  resources :recipes
  resources :users
end
