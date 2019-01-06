require 'spec_helper'
require './app'
require 'timecop'

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

  context "User's birthday is today" do
    scenario "User sees a happy birthday wish" do
      Timecop.freeze(Time.parse('3 October'))
      visit '/'
      expect(page).to have_content("What is your name?")
      fill_in 'name', with: 'Cristina'
      expect(page).to have_content("When is your birthday?")
      fill_in 'day', with: '3'
      page.select "October", :from => "month"
      click_button "Send"
      expect(page).to have_content("Happy birthday!")
      expect(page).not_to have_content("Your birthday is not today.")
    end
  end

  context "User's birthday is not today" do
    scenario "User is informed that their birthday is not today" do
      Timecop.freeze(Time.parse('3 October'))
      visit '/'
      expect(page).to have_content("What is your name?")
      fill_in 'name', with: 'Cristina'
      expect(page).to have_content("When is your birthday?")
      fill_in 'day', with: '2'
      page.select "October", :from => "month"
      click_button "Send"
      expect(page).not_to have_content("Happy birthday!")
      expect(page).to have_content("Your birthday is not today.")
    end

    scenario "User sees countdown for next birthday when it is this year" do
      Timecop.freeze(Time.parse('1 October'))
      visit '/'
      expect(page).to have_content("What is your name?")
      fill_in 'name', with: 'Cristina'
      expect(page).to have_content("When is your birthday?")
      fill_in 'day', with: '3'
      page.select "October", :from => "month"
      click_button "Send"
      expect(page).to have_content("It will be in 2 day(s).")
    end

    scenario "User sees countdown for next birthday when it is next year" do
      Timecop.freeze(Time.parse('5 October'))
      visit '/'
      expect(page).to have_content("What is your name?")
      fill_in 'name', with: 'Cristina'
      expect(page).to have_content("When is your birthday?")
      fill_in 'day', with: '3'
      page.select "October", :from => "month"
      click_button "Send"
      expect(page).to have_content("It will be in 363 day(s).")
    end
  end
end
