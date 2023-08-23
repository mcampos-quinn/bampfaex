json.extract! event, :id, :date, :showtimes, :screening_title, :description, :legacy_credit_text, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
