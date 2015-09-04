class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.string :quantity
      t.string :status

      t.timestamps null: false
    end
  end
end
