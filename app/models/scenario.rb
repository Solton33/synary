class Scenario < ApplicationRecord

  with_options presence: true do
    validates :scenario
    validates :title
  end
end
