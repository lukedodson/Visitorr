# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

plans = Plan.create([{ name: "basic", price: 12, email_limit: 100 }, { name: "standard", price: 19, email_limit: 250 }, { name: "advanced", price: 29, email_limit: 25000 }])