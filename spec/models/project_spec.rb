#necessary link to the rails_helper.rb so that we can use the functions/functionality contained within
require "rails_helper"

#uses rspec to test and make sure the validation tests succeed and are necessary for every project
RSpec.describe Project, type: :model do
    #runs all validation tests
  context "validations tests" do
    #checks to make sure a project must have a description to be valid
    it "ensures the description is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    #checks to make sure a project must have a title to be valid
    it "ensures the title is present" do
        project = Project.new(title: "Content of the Title")
        expect(project.valid?).to eq(false)
      end
    
      #checks to make sure saving a project successfully adds it to the database
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  #contains the data that is being tested and runs some minor testing on the database
  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    #tests database functionality (can it hold 3 projects?)
    it "should return all projects" do
      expect(Project.count).to eq(3) #Check THIS
    end

  end
end

