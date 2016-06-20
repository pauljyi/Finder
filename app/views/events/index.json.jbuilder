json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :start_date, :end_date, :location, :start_time, :end_time, :user_id
  json.url event_url(event, format: :json)
end
