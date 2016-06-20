require_relative '../rails_helper'

RSpec.describe Attendance, type: :model do

  it "can have attendees" do
    aUser = User.new
    aEvent = Event.new
    aUser.id = 1
    aEvent.id = 2
    attendance = Attendance.new
    attendance.event_id = aEvent.id
    attendance.user_id = aUser.id
    expect(attendance.user_id).to eq (1)
    expect(attendance.event_id).to eq (2)
  end

  it "can have attendees unattend" do
    aUser = User.new
    aEvent = Event.new
    aUser.id = 1
    aEvent.id = 2
    attendance = Attendance.new
    attendance.event_id = aEvent.id
    attendance.user_id = aUser.id
    expect(attendance.user_id).to eq (1)
    expect(attendance.event_id).to eq (2)
    attendance.event_id = nil
    attendance.user_id = nil
    expect(attendance.user_id).to eq (nil)
    expect(attendance.event_id).to eq (nil)
  end

  it "can have multiple attendees" do
    aUser = User.new
    bUser = User.new
    aEvent = Event.new
    aUser.id = 1
    bUser.id = 2
    aEvent.id = 1
    aAttendance = Attendance.new
    aAttendance.event_id = aEvent.id
    aAttendance.user_id = aUser.id
    expect(aAttendance.user_id).to eq (1)
    expect(aAttendance.event_id).to eq (1)
    bAttendance = Attendance.new
    bAttendance.event_id = aEvent.id
    bAttendance.user_id = bUser.id
    expect(bAttendance.user_id).to eq (2)
    expect(bAttendance.event_id).to eq (1)
  end

end
