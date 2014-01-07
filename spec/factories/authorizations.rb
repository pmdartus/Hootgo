# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "twitter"
    uid "1232321"
    oauth_token "qzdQZDdqzdqZDdzqDqfQZD"
    oauth_refresh_token "qzdqZdQZdQZdQDQzdQDSQDZ"
    oath_expires_at "2014-01-07 08:45:51"
  end
end
