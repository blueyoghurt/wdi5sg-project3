json.array!(@jobs) do |job|
  json.extract! job, :id, :latitude, :longitude, :name, :address, :title
  json.url job_url(job, format: :json)
end
