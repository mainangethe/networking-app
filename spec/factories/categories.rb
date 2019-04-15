FactoryBot.define do
  factory :category do
    sequence(:name) { |number| "name#{ number }"}
    sequence(:branch) { |number| "branch#{ number }"}
  end
end
