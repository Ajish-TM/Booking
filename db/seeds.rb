# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Service.create([
    { name: "Megathi Two Full Hands", description: "Two full hands", duration: 60, price: 1500.00 },
    { name: "Megathi Two Half Hands", description: "Two half hands", duration: 60, price: 1000.00 },
    { name: "Megathi Single Full Hand", description: "Single full hand", duration: 30, price: 750.00 },
    { name: "Megathi Single Half Hand", description: "Single half hand", duration: 30, price: 500.00 }
  ])
  