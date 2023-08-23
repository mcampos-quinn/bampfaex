json.extract! person, :id, :fname, :lname, :etc_name, :display_name, :birth_date, :death_date, :created_at, :updated_at
json.url person_url(person, format: :json)
