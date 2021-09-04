class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false
      t.references :profile, null: false, foreign_key: true
      t.timestamps
    end
  end
end
