include ActionDispatch::TestProcess

FactoryGirl.define do  factory :rewards_search do
    reward_id 1
search_id 1
  end
  factory :search do
    keywords "MyString"
type ""
reward_ids 1
  end
  factory :compensation do
    favor_id 1
reward_id 1
  end
  factory :reward do
    title "MyString"
description "MyText"
  end
  factory :activity do
    user nil
action "MyString"
trackable nil
trackable_type "MyString"
  end

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





