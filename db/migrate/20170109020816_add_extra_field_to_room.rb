class AddExtraFieldToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :bath_room, :integer
  end
end
