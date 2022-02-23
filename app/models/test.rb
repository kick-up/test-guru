class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :title, presence: true, uniqueness: { scope: :level,
    message: 'only one test per level' }
 

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :difficult, -> { by_level (5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (title) { 
    joins(:category)
    .where(categories: {title: title})
    .order(title: :desc) }
  
  def self.select_title(title)
    by_category(title).pluck(:title)
  end
end
