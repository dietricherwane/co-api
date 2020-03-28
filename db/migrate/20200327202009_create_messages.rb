class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.integer :created_uid
      t.integer :updated_uid

      t.timestamps
    end
  end
end
