class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :account_id
      t.string :active

      t.timestamps null: false
    end
  end
end
