FactoryGirl.define do
  factory :link do
    sequence(:original_link) { |n| "http://test#{n}.com" }
  end
end
