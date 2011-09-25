class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.string :sku
      t.string :description
      t.string :provider
      t.string :gender
      t.string :category

      t.timestamps
    end
  end
end
