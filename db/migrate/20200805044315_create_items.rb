class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :account
      t.string :title
      t.text :description
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
