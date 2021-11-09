require 'rails_helper'

#sets up base scenario to test that the homepage displays all of the prjects
RSpec.feature "HomePages", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end
