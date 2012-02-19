class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :content
      t.boolean :isanimal
      t.string :piid

      t.timestamps
    end
  end
end
