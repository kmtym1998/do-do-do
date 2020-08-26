Rails.application.routes.draw do
  get 'admin/new'
  root to: 'home#top'
  post '/' => 'home#sort_tasks'

  get 'login' => 'home#login'
  post 'login' => 'home#auth'

  post 'logout' => 'home#logout'

  post 'js/ajax_create', to: 'js#ajax_create'
  post 'js/ajax_edit', to: 'js#ajax_edit'
  post 'js/ajax_delete', to: 'js#ajax_delete'
  post 'js/ajax_before_edit', to: 'js#ajax_before_edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
