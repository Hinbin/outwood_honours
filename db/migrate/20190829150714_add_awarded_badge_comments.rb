class AddAwardedBadgeComments < ActiveRecord::Migration[6.0]
  def change
    add_column :awarded_badges, :user_comment, :string
    add_column :awarded_badges, :awarder_comment, :string
  end
end
