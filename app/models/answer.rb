class Answer < ApplicationRecord
  belongs_to :word
  belongs_to :lesson
  belongs_to :choice
  

  validates :word_id, presence: true
  validates :choice_id, presence: true

  def correct_answer
    correct = word.choices.collect.detect {|choice| choice.correct == true}
    correct.content
  end
end
