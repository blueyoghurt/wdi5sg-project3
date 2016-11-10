json.extract! user, :id, :name, :password, :contact, :is_biz, :is_seeker, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)