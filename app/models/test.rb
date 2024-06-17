class Test < ApplicationRecord

  def self.sorted_tests_by_category(category_name)
    joins(:category)
      .where(category: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
