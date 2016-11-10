json.extract! job, :id, :latitude, :longitude, :name, :address, :title, :created_at, :updated_at
json.url job_url(job, format: :json)
