json.extract! bizowners_review, :id, :bizowner_id, :jobseeker_id, :star, :description, :status, :created_at, :updated_at
json.url bizowners_review_url(bizowners_review, format: :json)
