Rails.application.routes.draw do
  resources :books
  # mount_devise_token_auth_for 'User', at: 'auth'
  # mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]

  devise_scope :auth do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]
    post '/accounts/sign_up', to: 'devise_token_auth/registrations#create'
    put '/accounts', to: 'devise_token_auth/registrations#update'
    delete '/accounts', to: 'devise_token_auth/registrations#destroy'
  end
end
