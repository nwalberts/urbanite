Location.create(name: "New York City", state: "NY", description: "The Big Apple")
Location.create(name: "San Francisco", state: "CA", description: "The city by the Bay")
Location.create(name: "Boston", state: "MA", description: "City on the Charles")

User.create(first_name: "Greg", last_name: "Something", home_location: "Boston", email: "something@nothing.com", password: "password123")
User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin")
