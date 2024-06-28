class User < ApplicationRecord
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def self.tests_by_level(level)
    Test.joins(:test_passings)
    .where(level: level, test_passings: { user_id: ids } )
  end
end
