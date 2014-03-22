json.array!(@images) do |image|
  json.extract! image, :id, :month, :hour, :small_square, :square, :weather, :image_id, :size, :category, :thumb, :exif, :title, :tags, :location, :type, :medium, :description, :normal, :link, :user, :bigger, :hits, :uploaded_at, :url, :original, :large, :taken_at, :dimension, :focal_length, :date_taken, :aperture, :camera, :metering_mode, :iso_speed_ratings, :city
  json.url image_url(image, format: :json)
end
