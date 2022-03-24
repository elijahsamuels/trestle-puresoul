Rails.application.routes.draw do
  
  resources :users do
    resources :events
  end
  
  resources :events do
    resources :users
  end

  resources :admin_users do
    resources :events
  end
  

  # get 'users/:id/events' => 'users#events', :as => :user_events


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
