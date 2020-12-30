Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get '/auth/github/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'

  get '/users/:user/repos', to: 'repos#show'
  get '/user/repos', to: 'repos#show_private'

end
