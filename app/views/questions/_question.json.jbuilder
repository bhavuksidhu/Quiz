json.extract! question, :id, :question, :options, :correct_answer, :quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
