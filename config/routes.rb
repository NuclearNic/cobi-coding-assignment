Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'application#home'

 	namespace :api do
  	namespace :v1 do
  		get 'book/:id' => 'books#show'
  		get 'books' => 'books#index'
  	end
  end

end
