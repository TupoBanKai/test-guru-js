# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :test_passages
  has_many :questions
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :join_categories, -> (category_name) {
    joins(:category).where('categories.title  = ?', category_name)
   }

  validates :title, :level, presence: true
  validates :level, numericality: { greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.category_tests
    join_categories.order(title: :desc).pluck(:title)
  end
end
