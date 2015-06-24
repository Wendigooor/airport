require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'planes#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :planes do
  	collection do
    	get  :control_center
    	post :start
   	end
  end
end
