require 'rails_helper'

feature "Creating projects" do
	before do
		visit '/'
		click_link "New Project"
		expect(page).to have_content("You need to sign in before creating a project.")

		login_as!(user) #need to create helper
		click_link "New Project"
	end

	scenario "with valid attributes" do 
		#all the required fields
		fill_in "Name", with: project.name
		fill_in "Description", with: project.description
		select(project.spoken_language, :from => "Main spoken language")
		fill_in "Number limit of members", with: project.members_limit
		fill_in "Area of knowledge", with: project.area_of_knowledge
		
		click_button "Create Project"

		expect(page).to have_content("Project has been created.")

		expect(page.current_url).to eq project_url(project)

		expect(page).to have_title(project.name)
	end

	scenario "without required attributes" do
		click_button "Create Project"
		expect(page).to have_content("Project cannot be created without required fields.")
	end
end