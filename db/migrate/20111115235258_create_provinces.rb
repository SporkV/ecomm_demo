class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.string :name
      t.string :code
      t.decimal :pst, :precision => 8, :scale => 2
      t.decimal :gst, :precision => 8, :scale => 2
      t.decimal :hst, :precision => 8, :scale => 2
      t.boolean :home_province

      t.timestamps
    end
  end

  def self.down
    drop_table :provinces
  end
end
