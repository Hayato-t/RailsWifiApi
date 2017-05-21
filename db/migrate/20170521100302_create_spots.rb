class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :janame
      t.string :enname
      t.string :zipcode
      t.string :jaaddress
      t.string :enaddress
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
