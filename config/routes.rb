Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :courses do
      resources :students, controller: :course_students, only: [:index]
    end

    resources :students
  end
end
