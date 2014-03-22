class AddLonlatToImage < ActiveRecord::Migration
  def change
    add_column :images, :lon, :point
    add_column :images, :lat, :point
    add_column :images, :lonlat, :point, :geographic => true
    add_reference :images, :lonlat, index: true, :spatial => true
  end
end
