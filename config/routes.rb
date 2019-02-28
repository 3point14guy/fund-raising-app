Rails.application.routes.draw do
  root "projects#index"
  get "projects" => "projects#index"
  post "projects" => "projects#create"
  get "projects/new" => "projects#new"
  delete "projects/:id" => "projects#destroy"
  get "projects/:id/edit" => "projects#edit", as: "edit_project"
  get "projects/:id" => "projects#show", as: "project"

  patch "projects/:id" => "projects#update"


end
