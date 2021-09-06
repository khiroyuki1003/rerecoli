class AddStatusToListReminds < ActiveRecord::Migration[6.0]
  def change
    add_column :list_reminds, :status, :string, default: "unfinished" 
  end
end
