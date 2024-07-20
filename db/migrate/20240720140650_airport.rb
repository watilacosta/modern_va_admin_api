class Airport < ActiveRecord::Migration[7.1]
  def change
    create_table :airports do |t|
      t.string :icao, null: false
      t.string :name
      t.string :latitude, null: false
      t.string :longitude, null: false

      t.timestamps
    end
  end
end
