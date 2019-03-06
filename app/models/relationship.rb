class Relationship < ApplicationRecord
  after_create :save_activity

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  has_one :activity, as: :action, dependent: :destroy

  private 
    def save_activity
      create_activity(user: follower)
    end
end
