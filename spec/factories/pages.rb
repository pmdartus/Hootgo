# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    authorization_id 1
    name "MyString"
    language_id 1
    image "MyString"
  end
end
