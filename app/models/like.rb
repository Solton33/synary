class Like < ApplicationRecord
  belongs_to :user
  belongs_to :scenario

def liked_by?(scenario.id)
  likes.where(scenario_id: scenario_id).exists?
end

end
