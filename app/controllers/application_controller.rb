require 'date'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def index
  	@users = User.all
  	@events = Event.all
    @tags = Tag.all
    @attendances = Attendance.all

# This is for the event search bar
    if !params[:search_string].nil?
        search_string = params[:search_string].strip.downcase
        search_string = search_string.gsub("'", "\''")
        @searchedEvents = Event.where("LOWER(title) LIKE '%#{search_string}%'")
        @searchedTags = Tag.where("LOWER(name) LIKE '%#{search_string}%'")

        @storage = []
        @searchedEvents.each do |event|
          @storage << event
        end
        @searchedTags.each do |tag|
          if !@storage.include?(tag.event)
            @storage << tag.event
          end
        end
          render "search.html.erb"
    end

# This is for the USER search bar
    if !params[:search_user].nil?
        search_user = params[:search_user].strip.downcase
        @searchedUsers = User.where("LOWER(username) LIKE '%#{search_user}%'")
        render "search_user.html.erb"
    end

# This is to sort the lists
    @events = Event.order(sort_column + " " + sort_direction)

# This is what creates the TOP EVENT

    if @attendances != nil

      @attendance_ids = []
      @attendances.each do |attendance|
        @attendance_ids << attendance.event_id
      end

      @attending_events = Event.where(:id => @attendance_ids)

      @future_events = []
      @attending_events.each do |event|
        if event.end_date.future?
        @future_events << event.id
        end
      end

      @to_be_attended_still = Attendance.where(:event_id => @future_events)

      @freq = @to_be_attended_still.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      @common_event = @to_be_attended_still.max_by { |v| @freq[v] }
      @top_event = Event.where(:id => @common_event)
    end

  end


  private

  # Setting defaults for sorting
  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


end
