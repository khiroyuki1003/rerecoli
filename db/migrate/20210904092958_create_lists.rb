class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :list_title, null: false
      t.text :list_detail
      t.integer :priority_id
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
