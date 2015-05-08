Rails.application.routes.draw do
  namespace :api, path: nil, constraints: { subdomain: 'api' } do
    resources :stays
  end

  root 'static#index'
end
