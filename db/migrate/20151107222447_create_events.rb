class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :country
      t.decimal :price
      t.integer :capacity
    end
  end
end
