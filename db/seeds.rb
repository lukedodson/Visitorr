# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plans = Plan.create([{ name: "basic", price: 13, email_limit: 100 }, { name: "standard", price: 20, email_limit: 200 }, { name: "advanced", price: 35, email_limit: 25000 }])

user = User.create(name: "visitorr dev", email: "visitorrdev@gmail.com", password: "password", password_confirmation: "password", plan_id: plans.last )

visitors = Visitor.create([{ name: "Ted Bundy", email: "ted@bundy.com", user_id: user.id}, { name: "Greg Maws" , email: "greg@maws.com", user_id: user.id }, { name: "Billy Dawson", email: "billy@dawson.com", user_id: user.id}])
