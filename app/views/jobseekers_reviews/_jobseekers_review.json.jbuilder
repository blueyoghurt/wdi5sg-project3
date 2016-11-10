json.extract! jobseekers_review, :id, :jobseeker_id, :bizowner_id, :star, :description, :status, :created_at, :updated_at
json.url jobseekers_review_url(jobseekers_review, format: :json)
