class Question < ApplicationRecord
  belongs_to :test
  has_many :gists
<<<<<<< Updated upstream
  has_many :answers
  has_many :test_passages
=======
  has_many :answers, dependent: :destroy
>>>>>>> Stashed changes

  validates :body, presence: true

end
