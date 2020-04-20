Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      get '/infos', to: 'information#index'
      put '/infos/set', to: 'information#update'

      get '/score', to: 'information#quizzScore'
      resources :users;
      post '/auth', to: 'users#login'
      post '/logout', to: 'users#logout'
      resources :quizzs do
        resources :questions do
        post '/answer', to: 'questions#answer'
        end
      end

    end
  end
end
