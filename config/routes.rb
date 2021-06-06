Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'schedule', to: 'schedules#index'
  get 'schedule_detail', to: 'schedules#show'
  post 'schedule_create', to: 'schedules#create'
  get 'schedule_edit/:id', to: 'schedules#edit'
  put 'schedule_update/:id', to: 'schedules#update'
  delete 'schedule_destroy/:id', to: 'schedules#destroy'
  get 'timeline', to: 'timelines#index'
  get 'evaluate', to: 'evaluates#index'
  get 'check_daily_schedule', to: 'schedule_results#index'
  post 'create_schedule_result', to: 'schedule_results#create'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
end
