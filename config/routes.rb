Rails.application.routes.draw do
  root to: 'questions#index'
  
  resources :questions do
    put :hide, on: :member
  end
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy] do
    put :change_header_color, on: :member
  end
end
