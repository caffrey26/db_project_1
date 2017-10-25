class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :challenger_player_id
      t.integer :challenger_pokemon_id
      t.integer :challenged_player_id
      t.integer :challenged_pokemon_id
      t.date :fight_date
      t.integer :fight_winner

      t.timestamps null: false
    end
  end
end
