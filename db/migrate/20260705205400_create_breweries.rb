class CreateBreweries < ActiveRecord::Migration[8.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.string :city
      t.string :state_province
      t.string :country
      t.decimal :latitude
      t.decimal :longitude
      t.string :website_url

      t.timestamps
    end
  end
end
