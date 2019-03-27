class CreatePermissionUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_users do |t|
      t.integer :user_id
      t.string :name_permission
      t.string :path
      t.string :icon

      t.timestamps
    end
  end
end
