class Badge < ApplicationRecord
  belongs_to :user
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :pic_name, :sym_term, presence: true

  TERMS = [:b, :a, :s]

  def self.metad(result)
    if result >= 50 && result < 75
      :b
    elsif result >= 75 && result < 95
      :a
    elsif result >= 95 && result <= 100
      :s
    end
  end



end
