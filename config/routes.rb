Rails.application.routes.draw do
  get '/users/me', to: 'users#me'
  resources :books
  resources :users

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]
  devise_scope :user do
    post '/account/sign_up' => 'devise_token_auth/registrations#create'
    put '/account' => 'devise_token_auth/registrations#update'
    delete '/account' => 'devise_token_auth/registrations#destroy'
  end
end
