require_relative '../rails_helper'


describe 'follow feature for a user', :type => :feature do
  it 'should allow a user to follow and unfollow another user' do
    # User 1 Sign Up
    visit '/users/sign_up'
    fill_in 'Username', :with => 'username1'
    fill_in 'Email', :with => 'user1@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    attach_file('user_image', 'spec/images/headshot.png')
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    click_link 'Logout'

    # User 2 Sign Up
    visit '/users/sign_up'
    fill_in 'Username', :with => 'username2'
    fill_in 'Email', :with => 'user2@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    attach_file('user_image', 'spec/images/headshot.png')
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'

    # User 2 follows User 1
    first(:link, 'Show').click
    click_link 'Follow'
    expect(page).to have_content 'Unfollow'

    click_link 'Unfollow'
    expect(page).to have_content 'Follow'
  end

end
