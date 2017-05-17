class CreateLogGames < ActiveRecord::Migration
  def change
    create_table :log_games do |t|
      t.datetime :date_played
      t.references :owner, index: true, foreign_key: true
      t.references :opponent, index: true, foreign_key: true
      t.integer :your_score
      t.integer :opponent_score
      t.boolean :log_game_won_by_you, null: false, default: false

      t.timestamps null: false
    end
  end
end
