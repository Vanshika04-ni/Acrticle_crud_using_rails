Rails.application.routes.draw do
  devise_for :customers

  devise_scope :customer do  
    get '/customers/sign_out' => 'devise/sessions#destroy'     
  end
  get 'home/index'
  get 'article/home'
  get 'search',to:"article#search"
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root "article#home"
  root "home#index"
  resources :article
end
