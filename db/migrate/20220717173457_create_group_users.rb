class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.references :group, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true, class_name: "User"

      t.timestamps
    end
  end
end
