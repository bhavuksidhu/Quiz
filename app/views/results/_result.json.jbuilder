json.extract! result, :id, :marks, :user_id, :quiz_id, :created_at, :updated_at
json.url result_url(result, format: :json)
