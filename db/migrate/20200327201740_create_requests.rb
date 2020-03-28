class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :reference
      t.text :text
      t.string :status
      t.string :type_request
      t.integer :created_uid
      t.integer :updated_uid

      t.timestamps
    end
  end
end
