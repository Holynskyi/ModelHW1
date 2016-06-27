class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
    add_reference :cart, :account, index: true
  end
end
