require 'rails_helper'

describe "the add a new user process" do
  it "adds a new user with authentication" do
    user = create(:user)
    question = create(:question)
    visit "/"
    click_link "Sign-in"
    fill_in "Email", :with => "user@email.com"
    fill_in "Password", :with => "password123"
    click_on "Log in"
    click_link "See Questions"
    expect(page).to have_content 'great'
  end

  # it "gives error when form field is left blank" do
  #   visit "/"
  #   click_link "New-user"
  #   click_on "Sign Up"
  #   expect(page).to have_content "problem"
  # end

end
