Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :courses do
      resources :students, controller: :course_students, only: [:index] do
        post '' => :create, as: :add_student_to_course
        delete '' => :destroy, as: :remove_student_from_course
      end
    end

    resources :students
  end
end
