class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author, :string, null: false
  end
end
