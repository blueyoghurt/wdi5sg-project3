json.extract! job, :id, :latitude, :longitude, :name, :address, :company_name, :created_at, :updated_at
json.url job_url(job, format: :json)
