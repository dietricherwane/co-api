class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.integer :created_uid
      t.integer :updated_uid

      t.timestamps
    end
  end
end
