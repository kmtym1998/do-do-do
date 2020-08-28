class AddColumnTagsToTask < ActiveRecord::Migration[5.2]
  def up
    add_column(:tasks, :tags, :string, array: true)
  end

  def down
    remove_column(:tasks, :tags)
  end
end
