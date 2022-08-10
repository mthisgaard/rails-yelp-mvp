require 'faker'

puts 'Destroying all restaurants....'
Restaurant.destroy_all
puts "...all restaurants are destroyed. #{Restaurant.count} restaurants left."

puts 'Creating new restaurants...'
13.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
end
puts "...#{Restaurant.count} restaurants have been created."

puts 'Adding reviews to restaurants...'
Restaurant.all.each do |restaurant|
  rand(0..7).times do
    Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review.split('.').first + '.',
      restaurant_id: restaurant.id
    )
  end
end
puts "...#{Review.count} reviews have been created."
