# frozen_string_literal: true

class UserTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
