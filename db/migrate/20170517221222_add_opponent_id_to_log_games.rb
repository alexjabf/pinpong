class AddOpponentIdToLogGames < ActiveRecord::Migration
  def change
    add_reference :log_games, :opponent, index: true, foreign_key: true
  end
end
