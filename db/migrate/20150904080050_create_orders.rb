class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.integer :tag_id
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
