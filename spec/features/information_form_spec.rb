require 'spec_helper'
require './app'

feature "Initial form" do
  scenario "User sees a greeting when they visit homepage" do
    visit '/'
    expect(page).to have_content("Hello!")
  end

  scenario "User sees a form and fills out their name and birthday date" do
    visit '/'
    expect(page).to have_content("What is your name?")
    fill_in 'name', with: 'Cristina'
    expect(page).to have_content("When is your birthday?")
    fill_in 'day', with: '3'
    page.select "October", :from => "month"
    click_button "Send"
    expect(page).to have_current_path("/birthday?name=Cristina&day=3&month=october")
  end
end
