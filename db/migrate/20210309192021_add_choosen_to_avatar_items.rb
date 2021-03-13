class AddChoosenToAvatarItems < ActiveRecord::Migration[6.0]
  def change
    add_column :avatar_items, :choosen, :boolean
  end
end
