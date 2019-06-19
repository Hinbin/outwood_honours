class CreateAwarders < ActiveRecord::Migration[6.0]
  def change
    create_table :awarders do |t|
      t.string :name

      t.timestamps
    end
  end
end
