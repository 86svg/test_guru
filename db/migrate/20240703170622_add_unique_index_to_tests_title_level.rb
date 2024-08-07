# frozen_string_literal: true

class AddUniqueIndexToTestsTitleLevel < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, %i[title level], unique: true
  end
end
