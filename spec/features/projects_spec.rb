#necessary link to the rails_helper.rb so that we can use the functions/functionality contained within
require 'rails_helper'

#testing feature of the app
RSpec.feature "Projects", type: :feature do
  #setting up base scenario and testing if you can create a new project and have it show up in the presented database
  context "Create new project" do
    before(:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

      #setting up test scenario and testing if you can successfully create a new project with a given description
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    #setting up test scenario and testing if it fails when you try and create a project without the description (title is filled in base scenario)
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  #setting up base scenario and testing if it succeeds when you try and edit a projecttitle
  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    #setting up test scenario and testing if it succeeds when you try and edit a project description AND title
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    #setting up test scenario and testing if it fails when you try and edit a project title, but edit the description to be blank
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  #setting up base scenario and testing that clicking destroy removes a project from the database
  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end
