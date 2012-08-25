require 'factory_girl'

FactoryGirl.define do 
  factory :category do 
    sequence(:name) {|n| "name#{n}" }
    association :parent
  end
end
