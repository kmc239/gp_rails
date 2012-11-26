class ChangePostsToEntries < ActiveRecord::Migration
  def change 
    rename_table :posts, :entries
  end
end
