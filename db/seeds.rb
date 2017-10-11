# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemon.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Pokemon.new
  t.dex_number = row['dex_number']
  t.name = row['name']
  t.image = row['image']
#   puts row['image']
  t.save
  puts "#{t.name}, #{t.dex_number} saved"
end

puts "There are now #{Pokemon.count} rows in the pokemons table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'player1.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Player.new
  t.name = row['name']
  t.city = row['city']

#   puts row['image']
  t.save
  puts "#{t.name}, #{t.city} saved"
end

puts "There are now #{Player.count} rows in the players table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'player_pokemon.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = PlayerPokemon.new
  t.player_id = row['player_id']
  t.pokemon_id = row['pokemon_id']

#   puts row['image']
  t.save
end

puts "There are now #{PlayerPokemon.count} rows in the Player_Pokemon table"
