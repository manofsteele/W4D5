require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "signup"
  end 

  feature 'signing up a user' do
    before(:each) do 
      visit new_user_url 
      fill_in 'Email', with: "jr@jr.com"
      fill_in 'Password', with: "123456"
      fill_in 'Username', with: "jeremiah"
      click_on "Sign Up!"
    end 
    
    scenario 'shows username on the homepage after signup' do 
      expect(page).to have_content "Hello jeremiah"
    end 
  end
end

feature 'logging in' do
  before(:each) do
    visit new_user_url 
    fill_in 'Email', with: "jr@jr.com"
    fill_in 'Password', with: "123456"
    fill_in 'Username', with: "jeremiah"
    click_on "Sign Up!"
    visit new_session_url 
    fill_in 'Password', with: "123456"
    fill_in 'Username', with: "jeremiah"
    click_on "Sign in!"
  end 
  
  scenario 'shows username on the homepage after login' do 
    expect(page).to have_content "Hello jeremiah"    
  end 

end

feature 'logging out' do
  before(:each) do
    visit new_user_url
  end
  
  scenario 'begins with a logged out state' do
    expect(page).not_to have_content "Hello"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
      visit new_session_url 
      user = User.create(email: "jr@jr.com", username: "jeremiah", password: "123456")
      fill_in 'Password:', with: "123456"
      fill_in 'Username:', with: "jeremiah"
      click_on "Sign in"
      save_and_open_page
      click_on "Log Out"
      expect(page).not_to have_content "Hello"
  end
end
