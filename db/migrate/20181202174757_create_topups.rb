class CreateTopups < ActiveRecord::Migration[5.2]
  def change
    create_table :topups do |t|
      t.references :customer, foreign_key: true
      t.integer :balance

      t.timestamps
    end
  end
end
