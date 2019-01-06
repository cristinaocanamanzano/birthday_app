require 'spec_helper'
require './app'

feature "Birthday calculator result" do
  scenario "User sees greeting and their name after filling out initial form" do
    visit '/'
    expect(page).to have_content("What is your name?")
    fill_in 'name', with: 'Cristina'
    expect(page).to have_content("When is your birthday?")
    fill_in 'day', with: '3'
    page.select "October", :from => "month"
    click_button "Send"
    expect(page).to have_current_path("/birthday")
    expect(page).to have_content("Hey, Cristina!")
  end
end
