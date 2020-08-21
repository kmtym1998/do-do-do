class AddColumnSortStateToUser < ActiveRecord::Migration[5.2]
  def up
    add_column(:users, :sort_state, :integer, null: false)
  end

  def down
    remove_column(:users, :sort_state)
  end
end
