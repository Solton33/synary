class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :user_id
      t.integer :scenario_id
      t.text :comment
    end
  end
end
