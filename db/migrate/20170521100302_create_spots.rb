class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name-ja
      t.string :name-en
      t.string :zipcode
      t.string :address-ja
      t.sring :address-en
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
