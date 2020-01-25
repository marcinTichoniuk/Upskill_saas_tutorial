Rails.application.routes.draw do
  root to: 'pages#home'
  
  get :about,  to: 'pages#about'

  # get 'contacts/new', to: 'contacts#new'
  resources :contacts 
end
