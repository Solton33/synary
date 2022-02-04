class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :scenario

  validates :comment, presence: true
end
