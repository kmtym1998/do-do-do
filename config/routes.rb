Rails.application.routes.draw do
  root to: 'home#top'
  get 'login' => 'home#login'

  post 'home/ajax_create', to: 'home#ajax_create'
  
  post 'home/ajax_edit', to: 'home#ajax_edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
