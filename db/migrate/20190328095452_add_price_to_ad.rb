class AddPriceToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :price, :decimal
  end
end
