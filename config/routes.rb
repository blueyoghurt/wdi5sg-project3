Rails.application.routes.draw do
  root 'jobs#index'

  get "job/:id" => "jobs#show_public", as: "show_job"

  post "applications/:id" => "applications#create"
  get "application/edit/:id" => "applications#edit", as: "application_approval"
  get "jobs/bizowner" => "jobs#bizowner"

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
  get "jobseeker/register-profile" => "jobseekers#new"
  post "jobseeker" => "jobseekers#create"
  get "jobseeker/profile/edit" => "jobseekers#edit", as: "edit_job_profile"
  get "jobseeker/profile/:id" => "jobseekers#show_public", as: "show_seeker"
  get "jobseeker/profile" => "jobseekers#show"
  put "jobseeker/:id" => "jobseekers#update"
  patch "jobseeker.:id" => "jobseekers#update"

  # Bizowners - custom routes for biz owners
  get "business/register-profile" => "bizowners#new", as: "bizowner_register"
  post "bizowners" => "bizowners#create"
  get "business/edit" => "bizowners#edit"
  get "business/profile/:id" => "bizowners#show_public", as: "show_business"
  get "business/profile" => "bizowners#show"
  put "business/profile" => "bizowners#update"
  patch "business/profile" => "bizowners#update"
  post "business/profile" => "bizowners#update"

  resources :jobseekers_reviews
  resources :bizowners_reviews
  resources :applications
  resources :users
  resources :bizowners
  resources :jobs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
