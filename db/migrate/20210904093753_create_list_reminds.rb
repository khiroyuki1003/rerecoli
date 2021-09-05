class CreateListReminds < ActiveRecord::Migration[6.0]
  def change
    create_table :list_reminds do |t|
      t.date :list_remind_date, null: false
      t.time :list_remind_time, null: false
      t.string :list_remind_title, null: false
      t.text :list_remind_detail
      t.references :list, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.timestamps
    end
  end
end
