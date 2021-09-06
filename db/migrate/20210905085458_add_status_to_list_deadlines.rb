class AddStatusToListDeadlines < ActiveRecord::Migration[6.0]
  def change
    add_column :list_deadlines, :status, :string, default: "unfinished" 
  end
end
