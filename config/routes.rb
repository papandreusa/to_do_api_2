Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :auth, controller: :users, action: :create
      namespace :auth do
        post :sign_in, controller: :sessions, action: :create
        delete :sign_out, controller: :sessions, action: :destroy
      end

      resources :projects do
        resources :tasks, shallow: true do
          patch :complete, controller: :tasks_completes, action: :update
          patch :position, controller: :tasks_positions, action: :update
        end
      end
    end
  end
end
