# Did not use "Resourceful route" for better readability
Rails.application.routes.draw do
  root 'application#full_json'
  get '/:resource', to: 'application#index'
  get '/:resource/:id', to: 'application#show'
  post '/:resource', to: 'application#create'
  patch '/:resource/:id', to: 'application#update'
  delete '/:resource/:id', to: 'application#destroy'
end
