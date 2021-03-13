class AddDefaultValueToChoosen < ActiveRecord::Migration[6.0]
  def change
     change_column :avatar_items, :choosen, :boolean, default: true
  end
end
