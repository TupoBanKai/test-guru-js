class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :email, :string, unique: true
  end

  def down
    delete_column :users, :password_digest, :string
    delete_column :users, :email, :string, unique: true
  end
end
