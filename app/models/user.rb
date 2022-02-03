class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  validates :email, presence: true

  scope :show_test_level, -> (level) { where(level: level) }
end
