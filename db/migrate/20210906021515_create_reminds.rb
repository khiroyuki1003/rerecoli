class CreateReminds < ActiveRecord::Migration[6.0]
  def change
    create_table :reminds do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :list_deadline, foreign_key: true
      t.references :list_remind, foreign_key: true
      t.string :action, null: false, default: ""
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end
end
