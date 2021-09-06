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
    resources :reminds, only: :index
  end

  post '/profiles/:profile_id/categories/:category_id/lists/:list_id/list_deadlines/:id/done' => 'list_deadlines#done',   as: 'done_profile_category_list_list_deadline'
  post '/profiles/:profile_id/categories/:category_id/lists/:list_id/list_reminds/:id/done' => 'list_reminds#done',   as: 'done_profile_category_list_list_remind'

  get '/profiles/:profile_id/date_index/unfinished' => 'date_index#unfinished', as: 'unfinished_profile_date_index'
  get '/profiles/:profile_id/date_index/done' => 'date_index#done', as: 'done_profile_date_index'
end
