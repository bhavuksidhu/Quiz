json.extract! profile, :id, :email, :first_name, :last_name, :phone_no, :admin_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
