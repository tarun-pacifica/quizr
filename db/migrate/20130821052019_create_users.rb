class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :password_digest
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
