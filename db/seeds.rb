# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: ENV["seed_email"]) do |user|
  user.first_name = 'Dexter'
  user.last_name = 'Wei Ying'
  user.is_seeker = true
  user.is_biz = true
  user.is_admin = true
  user.password = ENV["seed_password"]
  user.contact = 12345678
end
