class CreateReservationsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.bigint :room_id, null: false
      t.bigint :user_id, null: false
      t.date :date_from
      t.date :date_to

      t.timestamps
    end

    add_index :reservations, :room_id
    add_index :reservations, :user_id
  end
end
