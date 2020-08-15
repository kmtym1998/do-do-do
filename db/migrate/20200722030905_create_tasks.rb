class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.timestamp :deadline
      t.integer :priority
      t.integer :state
      t.text :memo
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
