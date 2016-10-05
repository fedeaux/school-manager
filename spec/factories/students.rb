FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Student #{n}" }
    sequence(:register_number) { |n|
      sprintf 'RN-%09d', n
    }

    status Status::ACTIVE

    trait(:inactive) do
      status Status::INACTIVE
    end
  end
end
