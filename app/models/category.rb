class Category < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { minimum: 50, maximum: 150 }
end
