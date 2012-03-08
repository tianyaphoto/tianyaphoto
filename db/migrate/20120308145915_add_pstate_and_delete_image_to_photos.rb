class AddPstateAndDeleteImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :pstate, :integer
    remove_column(:photos, :image)
  end
end
