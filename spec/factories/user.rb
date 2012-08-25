
FactoryGirl.define do 
  
  factory :user do
    sequence(:email) { |n| "hexudong#{n}@gmail.com"  }
    password "123456"
    sequence(:username) { |n| "hexudong#{n}"  }
  end

end
