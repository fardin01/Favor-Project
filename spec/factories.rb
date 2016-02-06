include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :favor do
    sequence(:title) {|n| "Title no #{n}"}
    sequence(:description) {|n| "description no #{n}"}
    completed false
    type nil
    user
  end

  factory :acceptance do
    favor
    user
    accepted false
  end

  factory :user do
    sequence(:firstname) {|n| "firstname #{n}"}
    sequence(:lastname) {|n| "lastname #{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password "private"
    password_confirmation "private"
    city "Budapest"
    latitude 47.497912
    longitude 19.040235
  end
end





