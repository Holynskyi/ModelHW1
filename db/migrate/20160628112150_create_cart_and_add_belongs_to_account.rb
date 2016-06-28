class CreateCartAndAddBelongsToAccount < ActiveRecord::Migration
  def change
    create_table :cart do |t|
    	t.belongs_to :account
    	t.timestamps null: false
    end
    add_reference :cart, :account
  end
end
