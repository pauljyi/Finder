require_relative '../rails_helper'
# require 'factory_girl_rails'

RSpec.describe Event, type: :model do

  it "has a title" do
    aEvent = Event.new
    aEvent.title = 'myTitle'
    expect(aEvent.title).to eq('myTitle')
  end

  it 'has validations on title' do
    aEventEmpty = Event.new
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.description = 'myDescription'
    aEventEmpty.start_date = '11/9/2015'
    aEventEmpty.end_date = '11/10/2015'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_time = "2000-01-01 10:00:00 UTC"
    aEventEmpty.end_time = "2000-01-01 11:00:00 UTC"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.title = 'Fun Time'
    expect(aEventEmpty.valid?).to eq true

  end

  it "has a description" do
    aEvent = Event.new
    aEvent.description = 'myDescription'
    expect(aEvent.description).to eq('myDescription')
  end

  it 'has validations on description' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.start_date = '11/9/2015'
    aEventEmpty.end_date = '11/10/2015'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_time = "09:00 AM"
    aEventEmpty.end_time = "11:00 AM"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.description = 'myDescription'
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a start date" do
    aEvent = Event.new
    aEvent.start_date = '2015-11-09'
    expect((aEvent.start_date).to_s).to eq('2015-11-09')
  end

  it "has an end date" do
    aEvent = Event.new
    aEvent.end_date = '2015-12-09'
    expect((aEvent.end_date).to_s).to eq('2015-12-09')
  end

  it 'has validations on start date' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.description = 'myDescription'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_time = "08:00 AM"
    aEventEmpty.end_time = "11:00 AM"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.start_date = '11/9/2015'
    aEventEmpty.end_date = '11/10/2015'
    expect(aEventEmpty.valid?).to eq true
  end

  it 'has validations on end date' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.description = 'myDescription'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_date = '11/9/2015'
    aEventEmpty.start_time = "09:00 PM"
    aEventEmpty.end_time = "11:00 PM"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.end_date = '11/12/2015'
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a location" do
    aEvent = Event.new
    aEvent.location = 'myLocation'
    expect(aEvent.location).to eq('myLocation')
  end

  # it 'has validations on location' do
  #   aEventEmpty = Event.new
  #   aEventEmpty.title = 'Fun Time'
  #   aEventEmpty.image_file_name = 'header-bg_copy.png'
  #   aEventEmpty.description = 'myDescription'
  #   aEventEmpty.start_date = '11/9/2015'
  #   aEventEmpty.end_date = '11/10/2015'
  #   aEventEmpty.start_time = "09:00 AM"
  #   aEventEmpty.end_time = "11:00 AM"
  #   expect(aEventEmpty.valid?).to eq false
  #   aEventEmpty.location = 'San Diego'
  #   expect(aEventEmpty.valid?).to eq true
  # end

  it "has a start time" do
    aEvent = Event.new
    aEvent.start_time = '2000-01-01 08:00:00 UTC'
    expect((aEvent.start_time).to_s).to eq('2000-01-01 08:00:00 UTC')
  end

  it 'has validations on start time' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.description = 'myDescription'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_date = '11/9/2015'
    aEventEmpty.end_date = '11/12/2015'
    aEventEmpty.end_time = "11:00 PM"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.start_time = "09:00 PM"
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a end time" do
    aEvent = Event.new
    aEvent.end_time = '2000-01-01 10:00:00 UTC'
    expect((aEvent.end_time).to_s).to eq('2000-01-01 10:00:00 UTC')
  end

  it 'has validations on end time' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.description = 'myDescription'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_date = '11/9/2015'
    aEventEmpty.end_date = '11/12/2015'
    aEventEmpty.start_time = "09:00 PM"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.end_time = "11:00 PM"
    expect(aEventEmpty.valid?).to eq true
  end

  it 'will not accept end date before start date' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.image_file_name = 'header-bg_copy.png'
    aEventEmpty.description = 'myDescription'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.start_date = '11/11/2015'
    aEventEmpty.end_date = '11/10/2015'
    aEventEmpty.start_time = "09:00 PM"
    aEventEmpty.end_time = "11:00 PM"
    expect(aEventEmpty.valid?).to eq false
  end

end
