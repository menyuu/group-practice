class GroupRemoveAndAdd < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :owner_id, :integer
    remove_column :group_users, :owner_id, :integer
  end
end
