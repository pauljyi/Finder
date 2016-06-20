class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  # GET /events
  # GET /events.json

  def index
    @events = Event.all
    @tags = Tag.all


    @tag_names = []
    @tags.each do |tag|
      if !@tag_names.include?(tag.name)
        @tag_names << tag.name
      end
    end

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @user = current_user

    @attendances = Attendance.where(:event_id => @event.id)
    @attendees = []
    @attendances.each do |attendance|
      @attendees << attendance.user_id
    end
    @eventees = User.where(:id => @attendees)
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.tags.build

  end

  # GET /events/1/edit
  def edit
    @event.tags.build
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    @attendances = Attendance.where(:event_id => @event.id)

    respond_to do |format|
      if @event.save
        format.html { attend }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
# DELETE ALL ATTENDANCES THAT THIS EVENT
    @attendances = Attendance.where(:event_id => @event)
    @attendances.each do |attendance|
      attendance.destroy
    end

    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def attend
    @event = Event.find(params[:id]) if @event.nil?
    @attendances = Attendance.where(:user_id => current_user.id)
    @user = current_user

    if Attendance.where(:user_id => current_user.id, :event_id => @event.id).blank?
      @attendance = Attendance.new
      @attendance.event_id = @event.id
      @attendance.user_id = current_user.id
      @attendance.save

      @attendances = Attendance.where(:event_id => @event.id)
      @attendees = []

      @attendances.each do |attendance|
        @attendees << attendance.user_id
      end

      @eventees = User.where(:id => @attendees)

      render 'show.html.erb'
    else
      render 'show.html.erb'
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.


  def unattend
    @event = Event.find(params[:id])
    @attendance = Attendance.where(:user_id => current_user.id, :event_id => @event.id)
    Attendance.destroy(@attendance)

    @attendances = Attendance.where(:event_id => @event.id)
    @attendees = []
    @attendances.each do |attendance|
      @attendees << attendance.user_id
    end
    @eventees = User.where(:id => @attendees)

    render 'show.html.erb'
  end


  require 'google/api_client'
  require 'google/api_client/client_secrets'
  require 'google/api_client/auth/installed_app'
  require 'google/api_client/auth/storage'
  require 'google/api_client/auth/storages/file_store'
  require 'fileutils'

  APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',"client_secret.json")
  SCOPE = 'https://www.googleapis.com/auth/calendar'

  # puts(CREDENTIALS_PATH)

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization request via InstalledAppFlow.
  # If authorization is required, the user's default browser will be launched
  # to approve the request.
  #
  # @return [Signet::OAuth2::Client] OAuth2 credentials

  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
    storage = Google::APIClient::Storage.new(file_store)
    auth = storage.authorize

    if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
      app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
      flow = Google::APIClient::InstalledAppFlow.new({
        :client_id => app_info.client_id,
        :client_secret => app_info.client_secret,
        :scope => SCOPE})
      auth = flow.authorize(storage)
      puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
    end
    auth
  end

  def saveEvent
  @event = Event.find(params[:id])
  start_time = ((@event.start_date).to_s + 'T' + (@event.start_time.strftime("%H:%M:%S")).to_s + '-07:00')
  end_time = ((@event.end_date).to_s + 'T' + (@event.end_time.strftime("%H:%M:%S")).to_s + '-07:00')
  # Initialize the API
  client = Google::APIClient.new(:application_name => APPLICATION_NAME)
  client.authorization = authorize
  calendar_api = client.discovered_api('calendar', 'v3')

  googleEvent = {
    'summary' => @event.title,
    'location' => @event.location,
    'description' => @event.description,
    'start' => {
      'dateTime' => start_time,
      'timeZone' => 'America/Los_Angeles',
    },
    'end' => {
      'dateTime' => end_time,
      'timeZone' => 'America/Los_Angeles',
    },
    # 'start' => {
    #   'dateTime' => '2015-06-28T09:01:00-07:00',
    #   'timeZone' => 'America/Los_Angeles',
    # },
    # 'end' => {
    #   'dateTime' => '2015-06-28T17:02:00-07:00',
    #   'timeZone' => 'America/Los_Angeles',
    # },
    'reminders' => {
      'useDefault' => false,
      'overrides' => [
        {'method' => 'email', 'minutes' => 24 * 60},
        {'method' => 'popup', 'minutes' => 10},
      ],
    },
  }

  results = client.execute!(
    :api_method => calendar_api.events.insert,
    :parameters => {
      :calendarId => 'primary'},
    :body_object => googleEvent)
  googleEvent = results.data
  # puts "Event created: #{event.htmlLink}"
  render 'show.html.erb'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :image, :start_date, :end_date, :location, :start_time,:end_time, :user_id, :latitude, :longitude, tags_attributes: [:id, :name, :_destroy])
  end

end
