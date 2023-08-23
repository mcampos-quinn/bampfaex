json.extract! series, :id, :series_start_date, :series_end_date, :series_type, :series_title, :series_description, :series_credits, :series_short_description, :created_at, :updated_at
json.url series_url(series, format: :json)
