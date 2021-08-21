Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects, defaults: { format: :json }

      post :auth, controller: :users, action: :create, defaults: { format: :json }
      namespace :auth do
        post :sign_in, controller: :sessions, action: :create, defaults: { format: :json }
        delete :sign_out, controller: :sessions, action: :destroy, defaults: { format: :json }
      end
    end
  end
end
