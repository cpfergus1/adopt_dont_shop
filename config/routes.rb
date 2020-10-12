Rails.application.routes.draw do
  root 'welcome#index'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'

  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy', via: :delete
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets', to: 'shelters#pets'
  get '/shelters/:id/pets/new', to: 'pets#new'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy', via: :delete

  get '/users/:id', to: 'users#show'

end
