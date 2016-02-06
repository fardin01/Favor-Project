require "rails_helper"

feature "Acceptance" do
  let (:user_one) { create(:user) }
  let (:user_two) { create(:user) }
  let (:favor_one) { create(:favor, type: "RequestedFavor", user: user_one) }
  let (:user_three) { create(:user) }


  end
end
