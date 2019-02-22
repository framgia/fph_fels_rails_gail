class Answer < ApplicationRecord
  belongs_to :word
  belongs_to :lesson, inverse_of: :answers
  belongs_to :choice

  # validates :word_id, presence: true
  # validates :choice_id, presence: true
end
