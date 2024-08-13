# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :create

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test:)
  end

  def admin?
    type == 'Admin'
  end

end
