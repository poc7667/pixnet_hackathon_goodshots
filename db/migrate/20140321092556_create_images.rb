class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :month
      t.integer :hour
      t.text :small_square
      t.text :square
      t.hstore :weather
      t.text :image_id
      t.text :size
      t.text :category
      t.text :thumb
      t.hstore :exif
      t.text :title
      t.text :tags
      t.hstore :location
      t.text :type
      t.text :medium
      t.text :description
      t.text :normal
      t.text :link
      t.hstore :user
      t.text :bigger
      t.hstore :hits
      t.text :uploaded_at
      t.text :url
      t.text :original
      t.text :large
      t.text :taken_at
      t.hstore :dimension
      t.text :focal_length
      t.text :date_taken
      t.text :aperture
      t.text :camera
      t.text :metering_mode
      t.text :iso_speed_ratings
      t.integer :city

      t.timestamps
    end
  end
end
