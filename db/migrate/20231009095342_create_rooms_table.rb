class CreateRoomsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.decimal :price, precision: 16, scale: 2
      t.integer :room_type
      t.integer :floor_number

      t.timestamps
    end
  end
end
