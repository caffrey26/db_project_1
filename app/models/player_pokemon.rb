class PlayerPokemon < ActiveRecord::Base
  belongs_to :player
  belongs_to :pokemon
  
  validates :player_id, presence: { message: "Player Name is required" }, uniqueness: { scope: :pokemon_id, message:" already has this pokemon." }
end
