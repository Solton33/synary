class Scenario < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :scenario
    validates :title
    validates :image
  end
end
