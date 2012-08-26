class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.date :birthdate
      t.string :country
      t.string :town
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
