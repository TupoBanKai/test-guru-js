class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def character_limit
    truncate(question.body, length: 25)
  end

  def html_url
    "https://gist.github.com/#{gist_remote_id}"
  end
end
