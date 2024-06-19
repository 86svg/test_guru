class Test < ApplicationRecord
  def self.sorted_tests_by_category(category)
    joins('JOIN category ON tests.category.id = tests.category_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
