class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,             null: false
      t.string :email,            null: false
      t.string :hashed_password,  null: false
      t.date :birth_date,         null: false
      t.string :img_icon
      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email, unique: true
  end
end
