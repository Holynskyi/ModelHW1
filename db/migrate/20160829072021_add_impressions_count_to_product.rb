class AddImpressionsCountToProduct < ActiveRecord::Migration
  def change
  	 add_column :products, :impressions_count, :integer
  end
end
