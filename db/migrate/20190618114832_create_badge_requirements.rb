# frozen_string_literal: true

class CreateBadgeRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_requirements do |t|
      t.integer :badge_id
      t.integer :badge_requirement_id

      t.index %i[badge_id badge_requirement_id], unique: true
      t.index %i[badge_requirement_id badge_id], unique: true
      t.timestamps
    end
  end
end
