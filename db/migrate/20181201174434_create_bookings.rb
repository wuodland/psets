class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :customer, foreign_key: true
      t.string :destination
      t.references :ride, foreign_key: true
      t.bigint :driverphn
      t.string :carno
      t.string :cartype

      t.timestamps
    end
  end
end
