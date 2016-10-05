FactoryGirl.define do
  factory :course do
    sequence(:name) {|n| "Course #{n}" }
    sequence(:description) {|n| "It is a course about #{n}" }
    status 1
  end
end
