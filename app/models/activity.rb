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

  def self.dashboard(user)
    where("user_id IN (?) OR user_id = ?", user.following_ids, user.id)
  end

end
