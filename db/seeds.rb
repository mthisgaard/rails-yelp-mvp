require 'faker'

puts 'Destroying all restaurants....'
Restaurant.destroy_all
puts "...all restaurants are destroyed. #{Restaurant.count} restaurants left."

puts 'Creating new restaurants...'
10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
end
puts "...#{Restaurant.count} restaurants have been created."
