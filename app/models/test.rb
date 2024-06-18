class Test < ApplicationRecord
  def self.sorted_tests_by_category(category)
    Test.joins('JOIN category ON tests.category.id = tests.category_id')
      .where('category.name = ?', category)
      .order(title: :desc)
      .pluck(:title)
  end
end
