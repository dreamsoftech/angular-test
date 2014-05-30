Rails.application.routes.draw do
  root :to => "visitors#index"

  namespace :api, defaults: {format: :json} do
  	resources :posts
  end

end