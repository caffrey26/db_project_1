json.extract! pokemon, :id, :name, :dex_number, :image, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
