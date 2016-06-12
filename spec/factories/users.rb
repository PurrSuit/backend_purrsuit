require 'faker'

FactoryGirl.define do
  random_password = Faker::Internet.password(8)
  factory :user do
    nickname "nickname"
    email{Faker::Internet.email}
    password random_password
    password_confirmation random_password
    experience_points 0
    role_admin false
  end
  factory :user_admin, class: User do
    nickname "admin"
    email "admin@user.com"
    password  "adminadmin"
    role_admin true
  end
end
