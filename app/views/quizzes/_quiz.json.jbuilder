json.extract! quiz, :id, :name, :duration, :description, :subject_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
