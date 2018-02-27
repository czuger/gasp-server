Rails.application.routes.draw do
  get 'ambiant/show'
  get 'ambiant/change'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ambiant#show'
end
