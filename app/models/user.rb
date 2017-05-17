class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :log_games, dependent: :destroy
  has_many :log_games, foreign_key: :opponent_id, dependent: :destroy
end
