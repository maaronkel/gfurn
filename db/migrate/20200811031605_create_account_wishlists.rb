class CreateAccountWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :account_wishlists do |t|
      t.references :item, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
