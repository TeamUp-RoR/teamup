#Factory with only required fields for project

FactoryGirl.define do
	factory :project do
		name "TeamUp"
		description "Some description about the web app"
		spoken_language "English"
		members_limit "8"
		area_of_knowledge "web development"
	end
end