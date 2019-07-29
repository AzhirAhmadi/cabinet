Rails.application.routes.draw do
  get 'wellcome/index'
  
  resources :docs
end
