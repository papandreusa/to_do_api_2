Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects

      post :auth, controller: :users, action: :create
      namespace :auth do
        post :sign_in, controller: :sessions, action: :create
        delete :sign_out, controller: :sessions, action: :destroy
      end
    end
  end
end
