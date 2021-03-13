class AddDefaultValuesToChoosen < ActiveRecord::Migration[6.0]
  def change
    remove_column :avatar_items, :choosen
    add_column :avatar_items, :choosen, :boolean, default: false
  end
end
