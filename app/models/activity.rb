class Activity < ApplicationRecord
  belongs_to :action, polymorphic: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  def categ_title
    action.category.title
  end

  def lesson_score
    action.category.lesson_score(user)
  end

  def other_user
    action.followed
  end

end
