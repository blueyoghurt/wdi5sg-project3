# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: ENV["seed_email"]) do |user|
  user.first_name = 'dexter'
  user.last_name = 'wei ying'
  user.is_seeker = false
  user.is_biz = false
  user.is_admin = false
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["biz_email"]) do |user|
  user.first_name = 'Bizowner'
  user.last_name = 'One'
  user.is_seeker = false
  user.is_biz = true
  user.is_admin = true
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["job_email"]) do |user|
  user.first_name = 'JobSeeker'
  user.last_name = 'One'
  user.is_seeker = true
  user.is_biz = false
  user.is_admin = true
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

Bizowner.find_or_create_by!(user_id: User.find_by(email: ENV["biz_email"]).id) do |biz|
  biz.user_id = User.find_by(email: ENV["biz_email"]).id
  biz.name = 'ABC Limited'
  biz.address = '123 Main Street'
  biz.postal_code = "643282"
  biz.description = 'Sells ABC beer'
  biz.license_number = 'JSFA324789'
end

Jobseeker.find_or_create_by!(user_id: User.find_by(email: ENV["job_email"]).id) do |job|
  job.user_id = User.find_by(email: ENV["job_email"]).id
  job.dob = '1990-10-31'
  job.postal_code = "643282"
  job.highest_qualification = 'Sells ABC beer'
  job.preferred_area = 'North'
  job.preferred_location = 'Ang Mo Kio'
  job.description = 'Hardworker'
  job.wage = 7
  job.start_date = '2016-10-01'
  job_end_date = '2016-10-31'
end
