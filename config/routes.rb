Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # root 'blogs#index'
  resources :blogs do
    resources :likes
    resources :comments
    resources :comments do
      resources :replies
    end
  end
  #root 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end