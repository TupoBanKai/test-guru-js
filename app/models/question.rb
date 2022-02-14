class Question < ApplicationRecord
  belongs_to :test
  has_many :gists
  has_many :answers
  has_many :test_passages

  validates :body, presence: true

end
