require "rails_helper"

RSpec.feature "Deleting a project" do
	let(:user) { FactoryGirl.create(:user) }
	let(:project) { FactoryGirl.create(:project, name: "TeamUp") }

	before do
		login_as(user) #need to create helper
		assign_role!(user, :manager, project) #need to create helper
	end	

	scenario "can delete project" do
		visit "/"
		click_link "TeamUp"
		click_link "Delete project"
		expect(page).to have_content "Project has been deleted."
		expect(page).to have_no_content "TeamUp"
	end
end