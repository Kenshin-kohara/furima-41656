FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'111aaa'}
    password_confirmation {password}
    last_name             {'試験'}
    first_name            {'項目'}
    last_name_read        {'シケン'}
    first_name_read       {'コウモク'}
    date_of_birth         {'1980-01-01'}
  end
end
