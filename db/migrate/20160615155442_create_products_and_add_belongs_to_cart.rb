class CreateProductsAndAddBelongsToCart < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.belongs_to :cart, index: true
    	t.string :name
    	t.string :description
    	t.integer :price
    	t.timestamps null: false
    end
  end
end