# frozen_string_literal: true

class CreateRequiredBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :required_badges do |t|
      t.integer :badge_id
      t.integer :required_badge_id

      t.index %i[badge_id required_badge_id], unique: true
      t.index %i[required_badge_id badge_id], unique: true
      t.timestamps
    end
  end
end
