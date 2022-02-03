class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: :author_id


  def self.sort_test_name_by_category(title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: title}).order(title: :desc).pluck(:title)
  end
end
