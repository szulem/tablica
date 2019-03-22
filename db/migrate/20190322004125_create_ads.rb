class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :category
      t.text :description
      t.string :localization
      t.string :phone

      t.timestamps
    end
  end
end
