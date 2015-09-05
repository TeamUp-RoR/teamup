require "spec_helper"

    #need to think about a "users" page where users can connect with each other

RSpec.feature "Users can view other users" do
    let(:user) {FactoryGirl.create(:user) }
    
    #Its probably a good idea for users to be forced to login before they can see anything
    
    before do 
        visit "/"
        click_link "Login/Signup"
        login_as!(:user)
    end
    
    scenario "User can see their page" do
        visit "/"
        click_link "My Account"
        expect(page.current_url).to eq user_url(:user)
    end
end