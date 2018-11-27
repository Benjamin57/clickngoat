# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.create!(name: "Tavares", city: "Dijon", description: "A pretty good goat", photo: "na", level: "goat", price_per_day: 10, position: "forward", user_id: 1)
Player.create!(name: "Germain", city: "Turin", description: "Worse goat in the world", photo: "na", level: "world-goat", price_per_day: 1, position: "substitute", user_id: 1)
Player.create!(name: "Chiellini", city: "Paris", description: "Best defender in the world", photo: "na", level: "world-class", price_per_day: 10000, position: "center-back", user_id: 1)
Player.create!(name: "Crivelli", city: "Caen", description: "Best player in Caen", photo: "na", level: "regional", price_per_day: 100, position: "forward", user_id: 1)
Player.create!(name: "Pogboum", city: "Manchester", description: "Best midfield in the world", photo: "na", level: "world-class", price_per_day: 100000, position: "midfielder", user_id: 1)
Player.create!(name: "Benzebut", city: "Madrid", description: "Best midfield in the world", photo: "na", level: "world-class", price_per_day: 100000, position: "midfielder", user_id: 1)
