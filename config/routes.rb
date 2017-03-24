Rails.application.routes.draw do



  resources :charges, only: [:new, :create, :update]

  resources :wikis

  resources :collaborators, only: [:create, :destroy]




# name of the controller(usually plural form of resource + controller)
  resources :registration_downgrades, only: [:create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

end
