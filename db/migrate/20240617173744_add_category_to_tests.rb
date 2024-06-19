class AddCategoryToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :category, :string, null: false
  end
end
