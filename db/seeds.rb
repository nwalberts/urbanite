# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
new_york = Location.create(name: "New York City", state: "NY", description: "The Big Apple")
san_francisco = Location.create(name: "San Francisco", state: "CA", description: "The city by the Bay")
boston = Location.create(name: "Boston", state: "MA", description: "City on the Charles")


user = User.create(first_name: "Greg", last_name: "Something", home_location: "Boston", email: "something@nothing.com", password: "password123")
admin = User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin")
