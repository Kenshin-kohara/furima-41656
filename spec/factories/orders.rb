FactoryBot.define do
  factory :order do
    post_code         { '023-0234' }
    prefecture_id     { 2 }
    city              { 'cityテスト' }
    street            { 'streetテスト' }
    building          { 'buildingテスト' }
    phone_number      { '02302340234' }
    token {"pk_test_a616b2dd01e1441eb2808070"}
  end
end
