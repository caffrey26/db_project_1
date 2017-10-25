class Fight < ActiveRecord::Base
    has_many :players
    validates :challenger_player_id, presence: true
    validates :challenger_pokemon_id, presence: true
    validates :challenged_player_id, presence: true
    validates :challenged_pokemon_id, presence: true
    validates :fight_date, presence: true
    validates :fight_winner, presence: true
end
