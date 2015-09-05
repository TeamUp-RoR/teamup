require 'spec_helper'

RSpec.feature "Creating users" do
    before do
        visit '/'
        click_link "Login/Signup"
        expect(page).to have_content("Login or create an account to start learning!")
        
        click_link "Signup"
    end
    
    scenario "with valid information" do
        fill_in "Name", with: user.name
        fill_in "Email", with: user.email
        fill_in "Areas of Interest", with: user.interests
        select(user.spoken_language, :from => "Main Spoken Language")
        select(user.spoken_language_level, :from => "Language fluency")
        select(user.timezone, :from => "Timezone")
        
        click_link "Sign Up"
        
        expect(page).to have_content("Welcome to TeamUp!")
        
        expect(page.current_url).to eq user_url(user)
        
    end
    
    scenario "without valid information" do
        click_link "Sign Up"
        expect(page).to have_content("Some information you entered was not valid. Please look over the form
        and try again")
        
    end
    
    scenario "Account already exists" do
        click_link "Sign Up"
        expect(page).to have_content("It looks like an account with that email already exists!")
    end
    
end
        
    
    