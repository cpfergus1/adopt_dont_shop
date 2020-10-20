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
  get '/pets/:id/apps', to: 'pets#apps'
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets', to: 'shelters#pets'
  get '/shelters/:id/pets/new', to: 'pets#new'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy', via: :delete

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/shelters/:id/reviews/new', to: 'reviews#new'
  post '/shelters/:id/reviews', to: 'reviews#create'
  get '/reviews/:id/edit', to: 'reviews#edit'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy', via: :delete


  patch '/apps/:id', to: 'apps#update'
  get '/apps/new', to: 'apps#new'
  post '/apps', to: 'apps#create'
  get '/apps/:id', to: 'apps#show'

  get '/admin/apps/:id', to: "admin#show"
  patch '/admin/apps/:id', to: "admin#update"
end
