puts "Cleaning up Database"
Restaurant.destroy_all
puts "Database is clean"

puts "Creating restaurants"
100.times do 
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    stars: rand(1..5),
    chef_name: Faker::Name.name
  )
  puts "Restaurant #{restaurant.id} is created"
end

puts "Done!"