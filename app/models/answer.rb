class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :max_answers
  validates :body, presence: true

  def max_answers
    errors.add(:base, "exceeds the maximum value of answers") if question.answers.count >= 4
  end
end
