Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }

  root to: 'tests#index'

  resources :badges, only: :index

  resources :tests, only: :index do
    resources :questions, shallow: :true

    member do
      post :start
    end
  end

  resources :feedbacks, only: [:create, :new]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions do
        resources :answers
      end
    end

    resources :gists, only: :index
  end

end
