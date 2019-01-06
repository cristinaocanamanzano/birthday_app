require 'spec_helper'
require './app'

feature "Initial form" do
  scenario "User sees a greeting when they visit homepage" do
    visit '/'
    expect(page).to have_content("Hello!")
  end

  scenario "User sees a form to fill out their name and birthday date" do
    visit '/'
    expect(page).to have_content("What is your name?")
    fill_in 'name', with: 'Cristina'
    expect(page).to have_content("When is your birthday?")
    fill_in 'day', with: '3'
    page.select "October", :from => "month"
    expect(page).to have_button("Send")
  end
end
