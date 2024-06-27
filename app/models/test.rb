class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :test_passings
  has_many :users
  def self.sorted_tests_by_category(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
