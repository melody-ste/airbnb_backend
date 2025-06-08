require 'faker'
puts "🧹 Nettoyage de la base..."

Reservation.destroy_all
Listing.destroy_all
City.destroy_all
User.destroy_all

puts "🏙️ Création des villes..."
cities = 10.times.map do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code[0..4]
  )
end

puts "👤 Création des utilisateurs..."
users = 20.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    phone_number: "06#{rand(10000000..99999999)}",
    description: Faker::Lorem.paragraph
  )
end

puts "🏠 Création des listings..."
listings = 50.times.map do
  Listing.create!(
    available_beds: rand(1..5),
    price: rand(30..150),
    description: Faker::Lorem.paragraph_by_chars(number: 200),
    has_wifi: [true, false].sample,
    welcome_message: "Bienvenue chez nous ! Faites comme chez vous.",
    city: cities.sample,
    admin: users.sample
  )
end

puts "📅 Création des réservations..."
listings.each do |listing|
  5.times do |i|
    start_date = i.weeks.ago.to_date - 7
    end_date = start_date + 2
    Reservation.create!(
      guest: users.sample,
      listing: listing,
      start_date: start_date,
      end_date: end_date
    )
  end

  5.times do |i|
    start_date = (Date.today + (i * 7) + 1)
    end_date = start_date + 2
    Reservation.create!(
      guest: users.sample,
      listing: listing,
      start_date: start_date,
      end_date: end_date
    )
  end
end

puts "✅ Seed terminé avec succès !"
