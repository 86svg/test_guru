# frozen_string_literal: true

class AddOrChangeColumnInTestPassings < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passings, :correct_questions_counter, :integer, default: 0, null: false
    change_column :test_passings, :current_question, foreign_key: { to_table: :questions }
  end
end
