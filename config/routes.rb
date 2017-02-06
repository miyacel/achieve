Rails.application.routes.draw do
root 'top#index' 


  devise_for :users
  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
  
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end


  get 'blogs' => 'blogs#index'

end
