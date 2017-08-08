# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    factory :user do
        name "Test"
        password "foobar"
        password_confirmation "foobar"
        email "MyString@123.com"
    end
end
