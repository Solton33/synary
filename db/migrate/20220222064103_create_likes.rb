class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|

      t.timestamps
      t.integer :user_id
      t.integer :scenario_id
    end
  end
end
