Rails.application.routes.draw do
  get 'admin/show'
  get 'admin/start'
  get 'admin/restart'
  get 'admin/stop'

  get 'ambiant/show'
  get 'ambiant/change'

  resources :ambiant, only: [ :show ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ambiant#show'
end
