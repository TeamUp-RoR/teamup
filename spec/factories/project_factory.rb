FactoryGirl.define do
	# need to organize it better and understand attributes that are lists
	# maybe separate programming_languages, features and pools as other factories
	
	factory :project do
		name "TeamUp" #required
		description "A project management tool combined with social network for students to develop projects." #required
		goals "Help students find peers to develop projects and give them the tools to organize the project."
		spoken_language "English" #required
		programming_languages "Ruby, Javascript, HTML, CSS"
		members_limit "8" #required
		area_of_knowledge "web development" #required
		features "Login system, file upload, chat, todos and others"
		domain "programming"
		pools "Which search tool are we going to use?, Which frontend framework are we going to use?"
	end
end