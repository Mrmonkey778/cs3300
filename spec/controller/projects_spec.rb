require "rails_helper"

RSpec.describe ProjectsController, type: :controller do

login_user

  #sets up base scenario to test that the database is successfully giving us the projects we want (by index)
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)       SAME THING AS LINE BELOW
      expect(response).to be_success
    end
  end

  #sets up base scenario to test and make sure we are getting back the correct data when we ask the model for project data
  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end