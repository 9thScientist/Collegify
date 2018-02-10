json.extract! user, :id, :username, :points, :university, :course, :biography, :created_at, :updated_at
json.url user_url(user, format: :json)
