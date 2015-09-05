FactoryGirl.define do
    # Need to think of the best method of email validation. I know nothing about that as of this point.
    # Also, what about more than one spoken language? I added something for fluency level.
    # Maybe it should be an option that you can have more than one spoken language?
    factory :user do
        name "User" #required
        email "user@example.com" #required
        interests "Web development, ruby"
        spoken_language "English" #required
        spoken_language_level "Native" #required
        timezone "UTC"
    end
end