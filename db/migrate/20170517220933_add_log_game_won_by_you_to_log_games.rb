class AddLogGameWonByYouToLogGames < ActiveRecord::Migration
  def change
    add_column :log_games, :log_game_won_by_you, :boolean
  end
end
