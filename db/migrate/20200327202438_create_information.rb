class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.integer :cases
      t.integer :deaths
      t.integer :recovered
      t.integer :created_uid
      t.integer :updated_uid

      t.timestamps
    end
  end
end
