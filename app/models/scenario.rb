class Scenario < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :scenario
    validates :title, length:{maximum:50}
    validates :image
  end
end
