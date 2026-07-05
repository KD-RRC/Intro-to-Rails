class CreateBeerHops < ActiveRecord::Migration[8.1]
  def change
    create_table :beer_hops do |t|
      t.references :beer, null: false, foreign_key: true
      t.references :hop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
