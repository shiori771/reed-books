FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(6)
    password { password }
    password_confirmation { password }
    profile { Faker::Lorem.sentences }
  end
end
