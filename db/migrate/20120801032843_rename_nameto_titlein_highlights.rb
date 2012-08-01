class RenameNametoTitleinHighlights < ActiveRecord::Migration
  def change
    rename_column :highlights, :name, :title
  end
end
