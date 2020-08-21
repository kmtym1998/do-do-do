class AddColumnPasswotdDigestToUser < ActiveRecord::Migration[5.2]
  def up
    remove_column(:users, :password)
    add_column(:users, :password_digest, :string, null: false)
  end

  def down
    remove_column(:users, :password_digest)
    add_column(:users, :password, :string, default: "sample", null: false)
  end
end