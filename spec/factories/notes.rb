# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    notebook_id 1
    user_id 1
    title "MyString"
    content "MyText"
  end
end
