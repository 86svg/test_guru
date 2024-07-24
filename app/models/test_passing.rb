# frozen_string_literal: true

class TestPassing < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def complited?
    current_question.nil?
  end

  def correct_percent
    100 / test.questions.count * correct_questions
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def number_questions
    test.questions.count
  end

  def successfull?
    correct_percent >= 85
  end

  private

  def correct_answer?(answer_ids = [])
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_next_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              test.questions.order(:id).where('id > ?', current_question.id).first
                            end
  end
end
