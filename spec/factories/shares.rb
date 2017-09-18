# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    title "MyString"
    content "MyText"
    note_id 1
  end
end
