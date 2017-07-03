class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :room, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :rooms
  end
end
