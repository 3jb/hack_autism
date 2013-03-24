Hackauts2::Application.routes.draw do

  root :to => 'Home#index'

  get "/home" => 'Home#index', :as => :home


end
