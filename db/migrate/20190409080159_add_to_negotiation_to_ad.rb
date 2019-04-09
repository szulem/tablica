class AddToNegotiationToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :to_negotiation, :boolean
  end
end
