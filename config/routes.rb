Rails.application.routes.draw do
  devise_for :users
  get 'wellcome/index'
  
  resources :docs

  authenticated :user do
    root "docs#index", as: "authenticated_root"
  end
  root "wellcome#index"
end
