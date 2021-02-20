class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :avatar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
