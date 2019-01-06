require 'spec_helper'
require './app'

feature "Initial form" do
  scenario "User sees a greeting when they visit homepage" do
    visit '/'
    expect(page).to have_content("Hello!")
  end
end
