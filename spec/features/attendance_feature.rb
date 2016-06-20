require_relative '../rails_helper'


describe 'attend feature for an event', :type => :feature do
  it 'should allow a user to attend an event' do
    # User 1 Sign Up
    visit '/users/sign_up'
    fill_in 'Username', :with => 'username1'
    fill_in 'Email', :with => 'user1@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    attach_file('user_image', 'spec/images/headshot.png')
    page.find("#signup").click
    page.has_content? 'Welcome! You have signed up successfully.'

   # Event Creation
   visit '/events'
   click_on('New Event')
   fill_in 'Title', :with => 'New Event'
   attach_file 'event_image', 'spec/images/headshot.png'
   fill_in 'Description', :with => 'myDescription'
   select( '2015', :from => 'event_start_date_1i')
   select( 'November', :from => 'event_start_date_2i')
   select( '11', :from => 'event_start_date_3i')
   select( '2015', :from => 'event_end_date_1i')
   select( 'November', :from => 'event_end_date_2i')
   select( '12', :from => 'event_end_date_3i')
   fill_in 'Location', :with => '9999 Rio San Diego Drive, San Diego, CA, United States'
   fill_in 'event_start_time', :with => '00:45:00.000'
   fill_in 'event_end_time', :with => '13:09:00.000'
   click_button('Create Event')
   page.has_content? 'myDescription'
   click_link 'Unattend'
   page.has_content? 'Attend'

    # User unattends Event
    click_link 'Attend'
    expect(page).to have_content 'Unattend'

  end

end
