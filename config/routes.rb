Rails.application.routes.draw do
  resources :applications
  resources :listings
  root 'public#index'

  # AUTHENTICATION
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  # Users - custom routes for users, registration, profile, editing etc
  get "register" => "users#new"
  post "users" => "users#create"
  get "profile" => "users#show"
  get "profile/edit" => "users#edit"
  put "profile" => "users#update"
  patch "profile" => "users#update"
  patch "users/:id" => "users#update"
  resources :users, only: [:index, :destroy] do
    patch 'admin' => "users#toggle_admin", on: :member
  end

  # Jobseekers - custom routes for job seekers
  get "job/register-profile" => "jobseekers#new"
  post "jobseekers" => "jobseekers#create"
  get "job/profile" => "jobseekers#show"
  get "job/edit" => "jobseekers#edit"
  put "job/profile" => "jobseekers#update"
  patch "job/profile" => "jobseekers#update"

  # Bizowners - custom routes for biz owners
  get "business/register-profile" => "bizowners#new"
  post "bizowners" => "bizowners#create"
  get "business/profile" => "bizowners#show"
  get "business/edit" => "bizowners#edit"
  put "business/profile" => "bizowners#update"
  patch "business/profile" => "bizowners#update"

  resources :listings
  resources :applications
  resources :bizowners
  resources :jobseekers
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
