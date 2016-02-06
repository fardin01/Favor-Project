module SpecsHelper

  def log_in(user = nil)
    user ||= create :user
    visit root_url
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  def log_out
    click_link "Sign out"
  end

  #alias_method :log_in, :login_as
end