Rails.application.routes.draw do
  
  get 'search/search'
  
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
 
  
  resources :users, only: [:index, :show, :edit, :update]do
   resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings'
  get 'followers' => 'relationships#followers'
  end
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end