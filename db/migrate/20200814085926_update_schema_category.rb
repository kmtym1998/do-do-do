class UpdateSchemaCategory < ActiveRecord::Migration[5.2]
  def up
    change_column(:categories, :title, :string, null: false)
    remove_column(:categories, :user_id)
    add_reference(:categories, :user, foreign_key: true, null: false)
  end

  def down
    change_column(:categories, :title, :string, null: true)
    change_column(:categories, :user_id, :integer, null: true, foreign_key: false)
  end
end
