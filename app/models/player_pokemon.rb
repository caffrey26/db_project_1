class PlayerPokemon < ActiveRecord::Base
  belongs_to :player
  belongs_to :pokemon
end
