# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "John Doe"
    email {"#{name.delete(' ').downcase}@hootgo.com"}
    password "123456"
  end
end
