class CreateAwarders < ActiveRecord::Migration[6.0]
  def change
    create_table :awarders do |t|
      t.string :name
      t.integer :external_id

      t.timestamps
    end
  end
end
