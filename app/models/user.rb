class User < ApplicationRecord
  has_many :test_passings
  has_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  def self.tests_by_level(level)
    Test.where(level: level)
  end
end
