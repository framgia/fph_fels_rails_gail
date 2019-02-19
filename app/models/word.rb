class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices ,update_only: true
  validates :content, presence: true
  validates_associated :choices
  validate :one_choice

  def correct_answer
    choices.find_by(correct: true).try(:content)
  end

  def one_choice 
    answer = choices.collect {|choice| choice.correct}.count(true)
    
    if answer > 1
      errors.add(:choice, " should have only ONE correct answer but you have #{answer}")
    end
  end

end
