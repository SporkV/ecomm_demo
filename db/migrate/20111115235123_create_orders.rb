class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :status
      t.decimal :total, :precision => 8, :scale => 2
      t.decimal :subtotal, :precision => 8, :scale => 2
      t.decimal :pst, :precision => 8, :scale => 2
      t.decimal :gst, :precision => 8, :scale => 2
      t.decimal :hst, :precision => 8, :scale => 2
      t.string :payment_processor
      t.string :processor_identifier
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
