class CreateListDeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :list_deadlines do |t|
      t.date :list_deadline_date, null: false
      t.time :list_deadline_time, null: false
      t.references :list, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
