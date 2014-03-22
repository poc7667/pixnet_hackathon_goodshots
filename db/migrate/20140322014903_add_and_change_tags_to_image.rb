class AddAndChangeTagsToImage < ActiveRecord::Migration
  def change
    add_column :images, :image_genre, :text
    change_column :images, :tags, :string, array: true, default: '[]'
  end
  # def change
  #     change_column :images, :tags, :string, array: true, default: '{}'
  #   end    
end
