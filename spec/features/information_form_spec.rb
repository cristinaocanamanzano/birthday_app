require 'spec_helper'
require './app'

feature "Initial form" do
  scenario "User sees a greeting when they visit homepage" do
    visit '/'
    expect(page).to have_content("Hello!")
  end

  scenario "User is asked about their name and date of birth" do
    visit '/'
    expect(page).to have_content("What is your name?")
    expect(page).to have_content("What is your birthday?")
  end
end
