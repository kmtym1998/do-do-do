Rails.application.routes.draw do
  root to: 'home#top'
  post '/' => 'home#sort_tasks'
  get 'category/:id' => 'home#show_tasks'
  get 'search/:query' => 'home#show_search_results'
  post 'search' => 'home#search'

  get 'login' => 'home#login'
  post 'login' => 'home#auth'

  post 'logout' => 'home#logout'

  post 'js/ajax_create', to: 'js#ajax_create'
  post 'js/ajax_edit', to: 'js#ajax_edit'
  post 'js/ajax_delete', to: 'js#ajax_delete'
  post 'js/ajax_before_edit', to: 'js#ajax_before_edit'

  get 'admin/' => 'admin#top'
  post 'admin/new' => 'admin#new'
  post 'admin/delete' => 'admin#delete'
  post 'admin/edit' => 'admin#edit'
  get 'admin/user/:id/tasks' => 'admin#user_tasks'

  get '*path', to: 'application#render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
