class AddUserIdToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :user_id, :integer
  end
end
