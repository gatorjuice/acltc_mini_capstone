class RemovePhotoFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image, :string
  end
end
