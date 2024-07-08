class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :test_passings

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sorted_tests_by_category, lambda { |category_name|
                                     joins(:category)
                                       .where(categories: { title: category_name })
                                       .order(title: :desc)
                                          }
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: {scope: :level}

  def self.sorted_category(category_name)
    sorted_tests_by_category(category_name).pluck(:title)
  end
end
