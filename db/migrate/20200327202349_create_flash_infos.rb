class CreateFlashInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :flash_infos do |t|
      t.string :title
      t.text :text
      t.string :image
      t.integer :active
      t.integer :created_int
      t.integer :updated_uid

      t.timestamps
    end
  end
end
