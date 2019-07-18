class AddBadgeGraphics < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :icon, :string
    add_column :badges, :inner_colour, :int
    add_column :badges, :level, :int
    add_column :badges, :icon_colour, :int
    add_column :badges, :banner, :string
  end
end
