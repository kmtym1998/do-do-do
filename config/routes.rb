Rails.application.routes.draw do
  root to: 'home#top'
  get 'login' => 'home#login'

  post 'js/ajax_create', to: 'js#ajax_create'
  post 'js/ajax_edit', to: 'js#ajax_edit'
  post 'js/ajax_before_edit', to: 'js#ajax_before_edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
