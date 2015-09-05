require 'spec_helper'

RSpec.feature "Deleting a user" do
    let(:user) {FactoryGirl.create(:user) }
    
    before do
        login_as(user)
    end
    
    scenario "Deleting user" do
        visit "/"
        click_link "My Account"
        click_link "Delete Account"
        expect(page).to have_content "Your account has been successfully removed"
        #need a redirect link to home page
        
    end
end