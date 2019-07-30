Rails.application.routes.draw do
  devise_for :users
  get 'wellcome/index'
  
  resources :docs

  root "wellcome#index"
end
