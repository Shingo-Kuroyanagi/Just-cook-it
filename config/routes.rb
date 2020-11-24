Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  # TOPページ
  get '/about' => 'homes#about', as: 'about'
  # Abooutページ
  get '/search' => 'searches#search', as: 'search'
  # 検索ページ
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }, skip: :all
  devise_scope :user do
    # サインアップ
    get 'sign_up' => 'devise/registrations#new', as: :new_user_registration
    post 'users' => 'devise/registrations#create', as: :user_registration
    # ゲストログイン
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    # ログイン、ログアウト
    get 'sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'sign_in' => 'devise/sessions#create', as: :user_session
    delete 'sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  # マイページ表示及び編集,退会ページ
  resources :users, only: %i[show edit update] do
    get 'withdrawal_show' => 'users#withdrawal_show'
    patch 'withdrawal'
  end

  resources :post_foods do
    resource :post_food_favorites, only: %i[create destroy]
    resources :post_food_comments, only: %i[create destroy]
    collection do
      get 'ranks'
      get 'calendars'
    end
  end
end
