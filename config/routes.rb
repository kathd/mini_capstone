Rails.application.routes.draw do
  get "/all_products" => "products#all_method"

  get "/form" => "products#form"
  post "/form_results" => "products#form_results"
end
