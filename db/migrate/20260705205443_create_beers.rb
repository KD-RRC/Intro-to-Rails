class CreateBeers < ActiveRecord::Migration[8.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.decimal :abv
      t.integer :ibu
      t.references :brewery, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
