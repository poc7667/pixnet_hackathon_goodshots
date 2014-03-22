class ChangeTagsToImages < ActiveRecord::Migration
  def change
      add_column :images, :image_tags, :hstore  
  end
end
