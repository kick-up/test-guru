class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests, inverse_of: 'created_tests'

  def show_tests_by_level(level)  
    Test.joins("INNER JOIN results ON tests.id = results.test_id").where(results: {user_id: self.id}, tests: {level: level})
  end
end
