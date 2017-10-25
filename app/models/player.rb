class Player < ActiveRecord::Base
  before_save :default_values
  def default_values
    if self.win_count != nil and self.win_count <0 then
      self.win_count = 0
    end
    self.win_count ||= 0
  end

  has_many :player_pokemons, :dependent => :destroy
  has_many :pokemons, -> { uniq }, :through => :player_pokemons
  has_many :fights
  validates :name, presence: { message: "Player Name is required" }, uniqueness: {message: "This name is already taken." }
end