Rails.application.routes.draw do
  get "/get_routes", to: "distances#get_routes"
end
