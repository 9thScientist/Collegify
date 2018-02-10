json.extract! note, :id, :title, :points, :description, :topic_id, :created_at, :updated_at
json.url note_url(note, format: :json)
