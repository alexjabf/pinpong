class LogGame < ActiveRecord::Base
  belongs_to :owner, foreign_key: :owner_id, class_name: 'User'
  belongs_to :opponent, foreign_key: :opponent_id, class_name: 'User'
  validates :date_played, :user_id, :your_score, :opponent_id, :opponent_score, presence: true
  validate :get_correct_score_margin, if:  (:your_score? and :opponent_score?)
  
  def get_correct_score_margin
    if (your_score - opponent_score)*(-1) != 2
      errors[:base] << 'Score difference must be not more or less than two points.'
    end
  end
end
