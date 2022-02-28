class Scenario < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :scenario
    validates :title, length:{maximum:50}
    validates :image
  end

  acts_as_taggable

  def self.search(search)
    if search != ""
      Scenario.where('scenario LIKE(?)', "%#{search}%")
    else
      Scenario.all
    end
  end

end
