class AddBadgeActive < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :active, :boolean
  end
end
