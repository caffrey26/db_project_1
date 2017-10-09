class Player < ActiveRecord::Base
  has_many :player_pokemons, :dependent => :destroy
  has_many :pokemons, -> { uniq }, :through => :player_pokemons
  
  validates :name, presence: { message: "Player Name is required" }, uniqueness: {message: "This name is already taken." }
end