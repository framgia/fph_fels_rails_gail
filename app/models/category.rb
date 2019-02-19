class Category < ApplicationRecord
    has_many :words, dependent: :destroy
    validates :title, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { minimum: 50, maximum: 90 }
end
