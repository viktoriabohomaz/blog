FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph_by_chars(800, false) }
    image { fixture_file_upload(Rails.root.join('spec', 'fixtures', "image.jpeg"), 'application/jpeg')}
  	copywriter
  end
end