# -*- encoding : utf-8 -*-
Rails32project::Application.routes.draw do
  

  devise_for :users

  resources :photos
  resources :tags, :only => [:index]

  get "welcome/index"
  get "welcome/form"
  
  root :to => 'welcome#index'

end
