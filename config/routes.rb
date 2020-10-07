Rails.application.routes.draw do
  namespace :v1 do
    get :questions, to: 'questions#index'
    get :disciplines, to: 'questions#disciplines'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
