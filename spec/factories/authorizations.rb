# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "MyString"
    uid "MyString"
    user_id 1
    oauth_token "MyText"
    oauth_refresh_token "MyText"
    oath_expires_at "2014-01-07 08:45:51"
  end
end
