class CreateSpatials < ActiveRecord::Migration
  def change
    create_table :spatials do |t|
      t.column :shap1, :geometry
      t.geometry :shp2
      t.line_string :path, :srid => 3785
      t.point :lonlat, :geographic => true
      t.point :lon
      t.point :lat
      t.index :lonlat, :spatial => true
      t.timestamps
    end
  end
end
