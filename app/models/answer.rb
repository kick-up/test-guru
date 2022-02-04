class Answer < ApplicationRecord
  belongs_to :question
  
  validates :body, presence: true
  validate :max_count, on: :create

  scope :correct_answer, -> { where(correct: true) }

  private

  def max_count
    errors.add(:base, 'max number of answers is 4') if question.answers.count >= 4
  end
end
