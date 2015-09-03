class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :description
      t.string :welcome_msg

      t.timestamps null: false
    end
  end
end
