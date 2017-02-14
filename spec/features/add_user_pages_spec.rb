require 'rails_helper'

describe "the add a new user process" do
  it "adds a new user with authentication" do
    visit "/"
    click_link "New-user"
    fill_in "Email", :with => "super user"
    fill_in "Password", :with => "superSecret"
    fill_in "Password confirmation", :with => "superSecret"
    click_on "Sign Up"
    expect(page).to have_content 'Welcome'
  end

  it "gives error when form field is left blank" do
    visit "/"
    click_link "New-user"
    click_on "Sign Up"
    expect(page).to have_content "problem"
  end

end
