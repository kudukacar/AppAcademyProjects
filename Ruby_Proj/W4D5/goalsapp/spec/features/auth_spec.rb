require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do 

  
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content 'Sign up'
  end

  feature 'signing up a user' do
    let!(:user) {create(:user)}

    scenario 'shows username on the homepage after signup' do
      visit users_url
      # save_and_open_page
      expect(page).to have_content "#{user.username}"
    end

  end
end

feature 'logging in', type: :feature do
  let!(:user) {create(:user)}
  scenario 'shows username on the homepage after login' do
    visit session_url
    expect(page).to have_content "#{user.username}"
  end
  
end

feature 'logging out', type: :feature do
  let!(:user) {create(:user)}
  scenario 'begins with a logged out state' do 
    visit new_session_url
    expect(page).to have_content "Log In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    expect(page).not_to have_content "#{user.username}"
  end



end

