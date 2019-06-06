require 'faker'

FactoryBot.define do
    factory :user do
        username { Faker::Internet.username }
        password { Faker::Internet.password(6,20) }
        email { Faker::Internet.email }
        birthday { Faker::Date.birthday(18, 65) }
    end
end