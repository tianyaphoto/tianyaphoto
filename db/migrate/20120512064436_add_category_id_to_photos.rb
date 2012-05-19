class AddCategoryIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :category_id, :integer, :default => 0

  end
end
