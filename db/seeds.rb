# Pet.destroy_all
# User.destroy_all
puts "🌱 Seeding spices..."

# Create Users
# user1 = User.create!(username: 'john_doe', password: 'password')
user1 = User.create(username: 'john_doe', email: 'john_doe@example.com', password: 'password')
user2 = User.create(username: 'jane_doe', email: 'jane_doe@example.com', password: 'password')
user3 = User.create(username: 'bob_smith', email: 'bob_smith@example.com', password: 'password')
user3 = User.create(username: 'alice_smith', email: 'alice_smith@example.com', password: 'password')
user4 = User.create(username: 'tom_jones', email: 'tom_jones@example.com', password: 'password')
user5 = User.create(username: 'sarah_jones', email: 'sarah_jones@example.com', password: 'password')

require 'rest-client'
require 'json'
require 'faker'

# Define the API endpoint and fetch the data
url = 'https://api.thedogapi.com/v1/breeds'
response = RestClient.get(url)
data = JSON.parse(response.body)

# Generate 20 random pets
50.times do
  # Select a random breed from the data
  breed = data.sample

  # Create a pet with random attributes using faker and data from the external api
  Pet.create(
    breed_name: breed['name'],
    breed: breed['breed_group'],
    color: Faker::Color.unique.color_name,
    breed_for: breed['bred_for'],
    sex: Faker::Gender.binary_type,
    lifespan: breed['life_span'],
    temperament: breed['temperament'],
    image_url: breed['image']['url'],
    user_id: rand(1..10) # Assuming there are 10 users in the system
  )
end


puts "✅ Done seeding!"
