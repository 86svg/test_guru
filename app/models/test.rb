class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :test_passings

  def self.sorted_tests_by_category(category_name)
    joins(:category)
      .where(category: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
