class CreateHops < ActiveRecord::Migration[8.1]
  def change
    create_table :hops do |t|
      t.string :name

      t.timestamps
    end
  end
end
