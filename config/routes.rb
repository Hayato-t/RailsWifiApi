Rails.application.routes.draw do
  get 'api/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get "app/show" => "app#show"
end
