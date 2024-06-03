Rails.application.routes.draw do
 
  get "up" => "rails/health#show", as: :rails_health_check

end

Rails.application.routes.draw do
  resources :users
  resources :events
end

