class ChangeTagsToImage < ActiveRecord::Migration

    def change
      change_column :images, :tags, :string, array: true, default: '{}'
    end    
  
end
