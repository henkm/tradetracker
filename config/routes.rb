Tradetracker::Application.routes.draw do
  resources :banners

  resources :productfeeds
  resources :affiliates
  get 'banner/:id/:style' => "banners#style", as: :banner_style
  get '/productfeed/:id/update' => "productfeeds#update_feed", as: :update_product_feed
  get '/productfeed/exmple' => "productfeeds#example"
  root :to => 'productfeeds#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
