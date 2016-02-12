# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times do
  SupportRequest.create(name: Faker::Name.name,
                        email: Faker::Internet.email,
                        department: SupportRequest::DEPARTMENTS.sample,
                        message: Faker::Lorem.paragraph)
end

puts Cowsay.say("Generated a 1000 support requests")
