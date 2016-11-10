json.extract! listing, :id, :business_owner_id, :job_title, :job_description, :industry, :vacancy, :work_location_postal_code, :work_area, :work_location, :wage_per_hour, :job_start_date, :job_end_date, :status, :created_at, :updated_at
json.url listing_url(listing, format: :json)
