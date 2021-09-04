class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false, unique: true
      t.string :precious_word
      t.date :birth_date, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
