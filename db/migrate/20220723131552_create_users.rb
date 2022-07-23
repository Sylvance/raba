class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :bio
      t.string :metadata
      t.string :settings

      t.timestamps
    end
  end
end
