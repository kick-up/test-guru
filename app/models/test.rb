class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :title, presence: true, uniqueness: { scope: :level,
    message: 'only one test per level' }
 

  scope :easy, -> { where (level: 0..1) }
  scope :medium, -> { where (level: 2..4) }
  scope :difficult, -> { where (level: 5..Float::INFINITY) }
  scope :by_category, -> (title) { 
    joins(:category)
    .where(categories: {title: title})
    .order(title: :desc) }
  
  def self.select_title(title)
    by_category(title).pluck(:title)
  end
end
