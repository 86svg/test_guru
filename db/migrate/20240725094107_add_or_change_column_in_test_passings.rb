# frozen_string_literal: true

class AddOrChangeColumnInTestPassings < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passings, :correct_questions_counter, :integer, default: 0, null: false
    add_foreign_key :test_passings, :questions, column: :current_question_id
  end
end
