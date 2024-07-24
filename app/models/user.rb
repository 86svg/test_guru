# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true # , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :create

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test:)
  end
end
