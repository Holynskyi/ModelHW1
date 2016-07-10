class CreateCartAndAddBelongsToAccount < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.belongs_to :account, index: true
    	t.timestamps null: false
    end
  end
end
