class Story < ApplicationRecord
    validates :picture, presence: true
    belongs_to :user
end