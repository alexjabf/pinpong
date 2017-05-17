class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :log_games, dependent: :destroy
  has_many :log_games, foreign_key: :opponent_id, dependent: :destroy
  validates :name, format: { with: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ .,]+$/, multiline: true }, length: { within: 1..60 }
  #Users email and password can be validated in devise initializer
  
end
