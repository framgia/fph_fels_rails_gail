class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  accepts_nested_attributes_for :answers
  validates_associated :answers

  def complete_answers
    answer_count = Lesson.answers.count
    unless answer_count == Category.words.count
      errors.add(:answer, " should be complete before submitting!")
    end
  end

end
