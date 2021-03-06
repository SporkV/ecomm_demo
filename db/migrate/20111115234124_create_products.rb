class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :stock_quantity
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
