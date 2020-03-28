class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :password
      t.integer :active
      t.references :profile, foreign_key: true
      t.integer :terms
      t.integer :is_admin
      t.integer :created_uid
      t.integer :updated_uid

      t.timestamps
    end
  end
end
