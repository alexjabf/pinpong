class CreateLogGames < ActiveRecord::Migration
  def change
    create_table :log_games do |t|
      t.datetime :date_played
      t.references :user
      t.integer :opponent_id
      t.integer :your_score
      t.integer :opponent_score

      t.timestamps null: false
    end
  end
end
