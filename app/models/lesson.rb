class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  validates_associated :answers
  has_many :choices, through: :answers
  before_create :correct_count
  has_one :activity, as: :action, dependent: :destroy

  private
    def correct_count
      self.score = answers.collect {|answer| answer.choice.correct}.count(true)
    end
end
