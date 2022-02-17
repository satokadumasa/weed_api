Rails.application.routes.draw do
  resources :books

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]
  devise_scope :user do
    post '/account/sign_up' => 'devise_token_auth/registrations#create'
    put '/account' => 'devise_token_auth/registrations#update'
    delete '/account' => 'devise_token_auth/registrations#destroy'
  end
  get '/user/me', to: 'user#me'
end
