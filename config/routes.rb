Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "home#index"
  devise_for :users, path: "", path_names: {
    sign_in: "login", sign_out: "logout", password: "secret",
    confirmation: "verification", unlock: "unblock",
    registration: "register", sign_up: "cmon_let_me_in"
  }

  resources :users
  namespace :admin do
    resources :users
    resources :subjects
    resources :courses
    resources :lessons
  end
  resources :courses
  resources :courses_users
  resources :lessons

  resources :lessons do
    collection do
      match "search" => "admin/lessons#search", :via => [:get, :post], :as => :search
    end
  end
end
