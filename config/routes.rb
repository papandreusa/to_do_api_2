Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects

      resources :users, only: %i[create index]
      post :session, controller: :sessions, action: :create
      delete :session, controller: :sessions, action: :destroy
      resources :sessions, only: %i[create destroy]
      post :refresh, controller: :refresh, action: :create
    end
  end
end
