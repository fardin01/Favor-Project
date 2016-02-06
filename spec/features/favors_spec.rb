require "rails_helper"

feature "Favors" do
  before(:each) do 
    log_in
  end

  scenario "request a favor" do
    click_link "Request a favor"
    fill_in "requested_favor_title", with: "Moving day"
    fill_in "requested_favor_description", with: "Help me move"
    click_button "Submit"

    expect(page).to have_content("Favor created successfully!")
    expect(page).to have_content("Moving day")
  end

  scenario "offer a favor" do
    click_link "Offer a favor"
    fill_in "offered_favor_title", with: "Got 2 hours free"
    fill_in "offered_favor_description", with: "I have 2 hours free on wed"
    click_button "Submit"

    expect(page).to have_content("Favor created successfully")
    expect(page).to have_content("Got 2 hours free")
  end
end