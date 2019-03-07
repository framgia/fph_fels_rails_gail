class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 90 }
  has_many :lessons, dependent: :destroy

  #retrieves the all the categories that has words 
  def self.words_exist
    Category.where("EXISTS(SELECT 1 from words where categories.id = words.category_id)")
  end
    
  def lesson_score(user)
    lesson = lessons.find_by(user_id: user.id)
    "#{lesson.score} of #{lesson.answers.count} "
  end
end
