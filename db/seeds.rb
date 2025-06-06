Reservation.destroy_all
City.destroy_all
Listing.destroy_all
User.destroy_all


puts "🌍 Création d'une ville..."
city = City.create!(
  name: "Paris",
  zip_code: "75000"
)

puts "👤 Création de l'utilisateur admin..."
admin_user = User.create!(
  email: "admin@example.com",
  phone_number: "0600000000",
  description: "Admin de la plateforme"
)

puts "👤 Création de l'utilisateur guest..."
guest = User.create!(
  email: "guest@example.com",
  phone_number: "0600000001",
  description: "Utilisateur invité"
)

puts "🏠 Création d'une annonce (listing)..."
listing = Listing.create!(
  available_beds: 2,
  price: 50,
  description: "lorem " * 140,
  has_wifi: true,
  welcome_message: "Bienvenue chez nous !",
  city: city,
  admin: admin_user
)

puts "📅 Création d'une réservation..."
reservation = Reservation.create!(
  guest: guest,
  listing: listing,
  start_date: Date.today + 1,
  end_date: Date.today + 3
)

puts "✅ Seed terminé avec succès !"
puts "Listing '#{listing.id}' réservé par #{reservation.guest.email}"