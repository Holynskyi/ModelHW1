class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :age
      t.timestamps null: false
      t.belongs_to :user
    end    
  end
end