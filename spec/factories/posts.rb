FactoryBot.define do
  factory :post do
    title {'test_title' * 3 }
    content { 'dummy text' * 100 }

    #associations
    user
    category
  end
end
