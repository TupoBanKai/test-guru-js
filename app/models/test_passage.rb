class TestPassage < ApplicationRecord
  CHECK_NUMBER = 50

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :current_question, presence: true

  before_validation :before_validation_set_current_question, on: :create

  def completed?
    next_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question if !(next_question.nil?)
    save!
  end

  def correct_answers
    current_question.answers.correct
  end

  def all_questions
    all_questions = test.questions
  end

  def success?
    count_true_answers >= CHECK_NUMBER
  end

  def count_true_answers
    self.correct_questions.to_f / test.questions.count * 100
  end

  private

  def before_validation_set_current_question
    self.current_question = all_questions.first if test.present?
  end

  def next_question
    x = all_questions.find_index(current_question)
    all_questions[x + 1]
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count)
  end

end
