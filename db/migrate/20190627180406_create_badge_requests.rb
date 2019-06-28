class CreateBadgeRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_requests do |t|
      t.integer :student_id, null: false
      t.integer :staff_id, null: false
      t.references :badge, foreign_key: true
      t.string :comment
      t.integer :status

      t.index %i[student_id badge_id], unique: true
      t.index %i[badge_id student_id], unique: true

      t.timestamps
    end
  end
end
