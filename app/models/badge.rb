class Badge < ApplicationRecord
  belongs_to :user
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :pic_name, :rule, presence: true
end
