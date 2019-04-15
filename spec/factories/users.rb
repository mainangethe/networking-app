FactoryGirl.define do
  factory :user do
    sequence(:username) { |number| "test#{ number }" }
    sequence(:email) { |number| "test#{ number }@test.com" }
    password '123456'
    password_confirmation '123456'
  end
end
