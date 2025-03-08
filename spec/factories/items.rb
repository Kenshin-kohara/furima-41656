FactoryBot.define do
  factory :item do
    name              {'test'}
    explanation       {'test' }
    price             {1000}
    category_id       {2}
    keep_id           {2}
    bearer_id         {2}
    prefecture_id     {1}
    shipping_day_id   {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
