class CreateAvatarItems < ActiveRecord::Migration[6.0]
  def change
    create_table :avatar_items do |t|
      t.references :avatar, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
