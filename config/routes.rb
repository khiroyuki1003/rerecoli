Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions", 
    registrations: "users/registrations"
    } 
  root to: "categories#index"

  resources :profiles, only: [:new, :create, :show, :edit, :update] do
    resources :categories, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :lists, only: [:new, :create, :show, :edit, :update, :destroy] do
        resources :list_deadlines, only: [:index, :edit, :update]
        resources :list_reminds
      end
    end
  end
end
