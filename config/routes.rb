Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  root 'homes#top'
  #TOPページ
  get '/about' => 'homes#about', as: 'about'
  #Abooutページ   
  
    devise_for :users,skip: :all
        devise_scope :user do
        #サインアップ
        get 'customers/sign_up' =>'customers/registrations#new', as: :new_customer_registration
        post 'customers'=>'customers/registrations#create', as: :customer_registration
        #ログイン、ログアウト
        get 'customers/sign_in'=>'customers/sessions#new',as: :new_customer_session
        post 'customers/sign_in'=>'customers/sessions#create',as: :customer_session
        delete 'customers/sign_out' =>'customers/sessions#destroy', as: :destroy_customer_session
    end
    resources :users,only: [:show,:edite,:update]
    #マイページ表示及び編集
    
    resources :post_foods do
        resources :post_food_comments,only: [:create,:destroy]
        resources :post_food_favorites,only: [:create,:destroy]
    end
    resources :ranks,only: [:index]
    resources :calendars,only[:index]
end
