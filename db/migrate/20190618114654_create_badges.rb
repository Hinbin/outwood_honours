# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.integer :external_id, null: false
      t.references :category, foreign_key: true
      t.references :awarder, foreign_key: true
      t.string :criteria
      
      t.timestamps
    end
  end
end
