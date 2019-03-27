class CreateCourseUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :course_users do |t|
      t.integer :status, null: false, default: 0
      t.decimal :debit
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :course_users, [:user_id, :created_at]
    add_index :course_users, [:course_id, :created_at]
  end
end
