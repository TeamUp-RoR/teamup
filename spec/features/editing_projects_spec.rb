require "rails_helper"

RSpec.feature "Editing project" do
	let(:user) { FactoryGirl.create(:user) }
	let(:project) { FactoryGirl.create(:project, name: "TeamUp") }

	before do
		login_as(user)
		assign_role!(user, :manager, project)

		visit '/'
=begin
		next link should return a list of projects that user takes part on
		even those user is not an project_admin_user
=end
		click_link 'My projects' 
		click_link 'TeamUp'
		click_link 'Edit project'
	end

	scenario "with valid attributes" do
		fill_in "Name", with: "TeamUp 2"
		click_button "Update project"

		expect(page).to have_content "Project has been updated."
		expect(page).to have_content "TeamUp 2"
	end

	scenario "with invalid attributes" do
		fill_in "Name", with: ""
		click_button "Update project"

		expect(page).to have_content "Project has not been updated."
	end
end