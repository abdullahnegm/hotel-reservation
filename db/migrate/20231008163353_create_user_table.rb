class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :phone_number
      t.string :ssn
      t.boolean :admin, default: false

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
