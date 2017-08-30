Rails.application.routes.draw do
  get "/all_products" => "products#all_method"
end
