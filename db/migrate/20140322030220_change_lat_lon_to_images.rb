class ChangeLatLonToImages < ActiveRecord::Migration
  def change
    add_column :images, :lon_f, :float
    add_column :images, :lat_f, :float
  end
end
