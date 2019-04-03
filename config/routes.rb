Rails.application.routes.draw do
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
    resources :courses_users
    resources :videos
  end
  resources :courses
  resources :courses_users
end
