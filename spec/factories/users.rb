# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email {"user_#{rand(1000).to_s}@factory.com" }
    password 'changeme'
    password_confirmation 'changeme'
  
  end
end
