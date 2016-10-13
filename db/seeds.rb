# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: ENV["seed_email"]) do |user|
  user.first_name = 'Admin'
  user.last_name = 'wei ying'
  user.is_seeker = false
  user.is_biz = false
  user.is_admin = true
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["biz_email"]) do |user|
  user.first_name = 'Slave driver'
  user.last_name = 'Yi Hui'
  user.is_seeker = false
  user.is_biz = true
  user.is_admin = true
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["job_email"]) do |user|
  user.first_name = 'JobSeeker'
  user.last_name = 'Kuan Yu'
  user.is_seeker = true
  user.is_biz = false
  user.is_admin = false
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["biz2_email"]) do |user|
  user.first_name = 'Bizowner'
  user.last_name = 'Victor'
  user.is_seeker = false
  user.is_biz = true
  user.is_admin = false
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["job2_email"]) do |user|
  user.first_name = 'Charlie'
  user.last_name = 'Find-A-Job'
  user.is_seeker = true
  user.is_biz = false
  user.is_admin = false
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

User.find_or_create_by!(email: ENV["biz3_email"]) do |user|
  user.first_name = 'Bizowner'
  user.last_name = 'Ronald'
  user.is_seeker = false
  user.is_biz = true
  user.is_admin = false
  user.password = ENV["seed_password"]
  user.contact = 12345678
end

Bizowner.find_or_create_by!(user_id: User.find_by(email: ENV["biz_email"]).id) do |biz|
  biz.user_id = User.find_by(email: ENV["biz_email"]).id
  biz.name = 'Hush Cosmetics'
  biz.address = '123 Main Street'
  biz.postal_code = "643282"
  biz.description = 'Sells Korean beauty products'
  biz.license_number = '201426278W'
end

Jobseeker.find_or_create_by!(user_id: User.find_by(email: ENV["job_email"]).id) do |job|
  job.user_id = User.find_by(email: ENV["job_email"]).id
  job.dob = '1990-10-31'
  job.postal_code = "643282"
  job.highest_qualification = 'A Levels'
  job.preferred_area = 'North'
  job.preferred_location = 'Ang Mo Kio'
  job.description = 'Hard worker'
  job.wage = 7
  job.start_date = '2016-10-01'
  job.end_date = '2016-10-28'
  job.availability = true
end

Bizowner.find_or_create_by!(user_id: User.find_by(email: ENV["biz2_email"]).id) do |biz|
  biz.user_id = User.find_by(email: ENV["biz2_email"]).id
  biz.name = "Victor's Chocolate Factory"
  biz.address = '321 Side Street'
  biz.postal_code = "543673"
  biz.description = 'Sells zebra meat'
  biz.license_number = '203243243W'
end

Bizowner.find_or_create_by!(user_id: User.find_by(email: ENV["biz3_email"]).id) do |biz|
  biz.user_id = User.find_by(email: ENV["biz3_email"]).id
  biz.name = "McDonalds"
  biz.address = '8 Sentosa Gateway'
  biz.postal_code = "098138"
  biz.description = 'Sells Burgers'
  biz.license_number = '203212343W'
end

Jobseeker.find_or_create_by!(user_id: User.find_by(email: ENV["job2_email"]).id) do |job|
  job.user_id = User.find_by(email: ENV["job2_email"]).id
  job.dob = '1987-10-01'
  job.postal_code = "786382"
  job.highest_qualification = 'O Levels'
  job.preferred_area = 'North'
  job.preferred_location = 'Woodlands'
  job.description = 'Very slack'
  job.wage = 5
  job.start_date = '2016-07-01'
  job.end_date = '2016-10-01'
  job.availability = true
end

Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz_email"]).id).id,
latitude: 1.2789591,
longitude: 103.8392531,
name: 'recruit express',
address: '1 keong saik road singapore',
company_name: "hush.sg",
job_title: "boss's minion",
job_description: 'work your ass off',
industry: 'slavery',
vacancy: 4,
wage_per_hour: 2,
job_start_date: '2016-10-01',
job_end_date: '2016-10-07',
status: true)

Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz_email"]).id).id,
latitude: 1.2789597,
longitude: 103.8491142,
name: 'recruit express',
address: '8 Marina View #30-01 singapore',
company_name: "hush.sg",
job_title: "slave",
job_description: 'work day and night',
industry: 'slavery',
vacancy: 2,
wage_per_hour: 1,
job_start_date: '2016-10-01',
job_end_date: '2016-10-14',
status: true)


Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz2_email"]).id).id,
latitude: 1.3188724,
longitude: 103.8263123,
name: 'chocolate victor',
address: '1 robin road singapore',
company_name: "victor's chocolate factory",
job_title: "experiment test subject",
job_description: 'get experimented on',
industry: 'slavery',
vacancy: 2,
wage_per_hour: 7,
job_start_date: '2016-10-01',
job_end_date: '2016-10-07',
status: true)

Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz2_email"]).id).id,
latitude: 1.2789597,
longitude: 103.8491142,
name: 'chocolate victor',
address: '8 Marina View singapore',
company_name: "victor's chocolate factory",
job_title: "guinea pig",
job_description: 'eat chocolates all day',
industry: 'slavery',
vacancy: 4,
wage_per_hour: 7,
job_start_date: '2016-11-01',
job_end_date: '2016-11-09',
status: true)

Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz2_email"]).id).id,
latitude: 1.3485959,
longitude: 103.7158263,
name: 'chocolate victor',
address: '8 Jurong West Street 52 singapore 649296',
company_name: "victor's chocolate factory",
job_title: "waiter",
job_description: 'serve chocolates',
industry: 'F & B',
vacancy: 4,
wage_per_hour: 7,
job_start_date: '2016-10-01',
job_end_date: '2016-10-07',
status: true)

Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz3_email"]).id).id,
latitude: 1.332516,
longitude: 103.8463433,
name: 'McDonalds',
address: '490, Lorong 6 Toa Payoh #01-11 Singapore 310490',
company_name: "McDonalds",
job_title: "waiter",
job_description: 'serve burgers',
industry: 'F & B',
vacancy: 4,
wage_per_hour: 10,
job_start_date: '2016-10-01',
job_end_date: '2016-10-31',
status: true)

Job.create(bizowner_id: Bizowner.find_by(user_id: User.find_by(email: ENV["biz_email"]).id).id,
latitude: 1.2789591,
longitude: 103.8392531,
name: 'recruit express',
address: '1 keong saik road singapore',
company_name: "hush.sg",
job_title: "part time packer",
job_description: 'be a pack rat',
industry: 'slavery',
vacancy: 4,
wage_per_hour: 1.99,
job_start_date: '2016-10-01',
job_end_date: '2016-10-07',
status: true)

Application.create(
job_id: 1,
jobseeker_id: 1,
status: "Pending"
)

Application.create(
job_id: 2,
jobseeker_id: 1,
status: "Pending"
)

Application.create(
job_id: 3,
jobseeker_id: 2,
status: "Pending"
)
