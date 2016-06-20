class Attendance < ActiveRecord::Base
	belongs_to :user
	belongs_to :attendee, :class_name => 'Event'
end
