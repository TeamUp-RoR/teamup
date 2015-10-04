require "rails_helper"
=begin
	Maybe we could give users an option to make their projects 'not-public'.
	It could be some kind of 'premium' feature or we could work on it in 
	a later fase of the development.
	Right now, all users that enter the app as visitors can see projects details
	with the required info (name, description etc)
=end

RSpec.feature "Users can view projects" do
	let(:project) { FactoryGirl.create(:project, name: "TeamUp") }

	scenario "can see project" do
		visit "/"
	  click_link "TeamUp"
	  expect(page.current_url).to eq project_url(project)
	end
end