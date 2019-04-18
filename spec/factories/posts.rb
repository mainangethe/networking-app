FactoryBot.define do
  factory :post do
    title {'test_title ' * 3 }
    content { 'dummy text ' * 20 }

    #associations
    user
    category
  end
end
