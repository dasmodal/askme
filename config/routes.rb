Rails.application.routes.draw do
  root to: 'questions#index'

  resources :hashtags, only: %i[show], param: :body
  resources :questions do
    put :hide, on: :member
  end
  resource :session, only: %i[new create destroy]
  resources :users, except: %i[index], param: :nickname
end
