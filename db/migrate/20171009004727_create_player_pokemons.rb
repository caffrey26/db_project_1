class CreatePlayerPokemons < ActiveRecord::Migration
  def change
    create_table :player_pokemons do |t|
      t.integer :player_id
      t.integer :pokemon_id

      t.timestamps null: false
    end
  end
end
