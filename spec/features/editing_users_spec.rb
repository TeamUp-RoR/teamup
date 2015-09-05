require 'spec_helper'

RSpec.feature "Editing user" do
    let(:user) { FactoryGirl.create(:user) }
    
    before do
        login_as!(user)
        click_link "Edit my information"
        
    end
    
    scenario "with valid email" do
        fill_in "Email", with: "newemail@example.com"
        click_link "Update Information"
        
        expect(page).to have_content "Your account has been updated"
    end
    
    # This could just be something where you could add interests or take them away. Not sure yet
    # how we will store interests/expertise.
    scenario "with valid interests" do
        fill_in "Areas of Interest", with: "Python, Django"
        click_link "Update Information"
        
        expect(page).to have_content "Your account has been updated"
    end
    
    #Also not sure how best to store this information
    
    scenario "with valid timezone" do
        fill_in "timezone", with: "GMT"
        click_link "Update Information"
        
        expect(page).to have_content "Your account has been updated"
    end
    
    scenario "with valid languages" do
        fill_in "spoken_language", with: "Farsi"
        select(user.spoken_language_level, :from => "Level of fluency")
        click_link "Update Information"
        
        expect(page).to have_content "Your account has been updated"
    end
    
    scenario "without valid email" do
        fill_in "Email", with: ""
        
        expect(page).to have_content "Your account has not been updated. Please supply a valid email address"
        
    end
    
end
    
    