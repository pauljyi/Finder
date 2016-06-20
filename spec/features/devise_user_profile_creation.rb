require_relative '../rails_helper'

describe 'devise user account sign up', :type => :feature do
  it 'should create a User' do
    # User 1 Sign Up
    visit '/users/sign_up'
    fill_in 'Username', :with => 'username'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    attach_file('user_image', 'spec/images/headshot.png')

    click_button 'Sign up'
    expect(page).to have_xpath("//img[contains(@src, 'headshot.png')]")
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
