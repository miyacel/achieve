Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
root 'top#index' 


  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_calbacks: "users/omniauth_calbacks"
  }
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
  
  resources :poems, only: [:index, :show]


  get 'blogs' => 'blogs#index'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
