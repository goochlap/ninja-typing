class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
