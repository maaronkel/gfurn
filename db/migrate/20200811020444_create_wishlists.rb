class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.integer :item_id
      t.integer :account_id

      t.timestamps
    end
  end
end
