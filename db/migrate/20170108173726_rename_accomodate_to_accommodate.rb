class RenameAccomodateToAccommodate < ActiveRecord::Migration
  def down
  	rename_column :rooms, :accomodate, :accommodate
  end
end
