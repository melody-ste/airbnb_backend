# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
u = User.create(email: "123@gmail.com", phone_number:"0645004548", description:"lorem")

l = Listing.create(available_beds: 2, price: 50, description:"lorem", has_wifi: true, welcome_message:"lorem")

resa = Reservation.create(user: u, listing: l)