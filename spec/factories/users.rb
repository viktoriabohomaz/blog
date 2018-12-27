FactoryBot.define do
  factory :copywriter do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end

  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    role { 'admin' }
  end

  trait :with_posts do
    after(:create) do |_p|
      create_list(:post, 5, user: copywriter)
    end
  end
end