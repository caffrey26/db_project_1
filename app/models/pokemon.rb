class Pokemon < ActiveRecord::Base
  has_many :player_pokemons, class_name: "PlayerPokemon"
  has_many :players, -> { uniq }, :through => :player_pokemons
  
  validates :name, presence: { message: "Pokemon Name is required" }, uniqueness: {message: "A pokemon with this name already exists." }
  validates :dex_number, presence: { message: "Pokemon Dex Number is required" }, uniqueness: {message: "A pokemon with this dex number already exists." }, numericality: { greater_than_or_equal_to: 0}
end
