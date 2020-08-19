class UpdateSchemaTask < ActiveRecord::Migration[5.2]
  def up
    change_column(:tasks, :title, :string, null: false)
    remove_column(:tasks, :user_id)
    remove_column(:tasks, :category_id)
    add_reference(:tasks, :user, foreign_key: true, null: false)
    add_reference(:tasks, :category, foreign_key: true, null: false)
  end

  def down
    change_column(:tasks, :title, :string, null: true)
    change_column(:tasks, :user_id, :integer, null: true, foreign_key: false)
    change_column(:tasks, :category_id, :integer, null: true, foreign_key: false)
  end
end
