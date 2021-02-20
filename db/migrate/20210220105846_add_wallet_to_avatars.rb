class AddWalletToAvatars < ActiveRecord::Migration[6.0]
  def change
    add_column :avatars, :wallet, :integer
  end
end
