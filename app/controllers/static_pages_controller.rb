class StaticPagesController < ApplicationController
  def home
  end
  def standings
    @ch = Player.joins("INNER JOIN Fights ON Fights.challenger_player_id = Players.id ") 
    @cd = Player.joins("INNER JOIN Fights ON Fights.challenged_player_id = Players.id ") 
    @players =Player.order(win_count: :desc)
    
  end
end
