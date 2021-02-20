class CreateAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :avatars do |t|
      t.string :gender
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
