FactoryGirl.define do
  factory :customer do
    birthdate Date.new
    country 'Ukraine'
    email 'some.email@gmail.com'
    name 'Test User'
    password 'password'
    town 'Kiev'
  end
end